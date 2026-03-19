---
name: go-test
description: Write Go tests for a given file, package, or function. Produces table-driven tests with testify assertions, inline mocks defined per test case, and fake k8s clientsets where applicable. Use when asked to "write tests", "add tests", or "test this function".
argument-hint: [file or function to test]
allowed-tools: Read, Glob, Grep, Bash(go list *), Bash(go mod *)
---

# Write Go Tests

Write idiomatic Go tests for `$ARGUMENTS`.

## Discovery phase

Before writing a single line of test code:

1. **Read the target** — read the file(s) being tested in full. Understand every exported function and its contract.
2. **Detect testify** — run `grep -r "github.com/stretchr/testify" go.mod go.sum 2>/dev/null`. If found, use testify throughout; otherwise use `testing` only.
3. **Detect k8s clientsets** — grep for `k8s.io/client-go` in go.mod. If present, use `k8s.io/client-go/kubernetes/fake` and related fake packages for any kubernetes API interactions.
4. **Identify interfaces** — find every interface the code under test depends on (parameters, struct fields, embedded types). These are mock candidates.
5. **Locate existing mocks** — check `*_mock_test.go`, `mock_*.go`, or a `mocks/` directory. Reuse if they match; otherwise define fresh mocks inline in the `_test.go` file.
6. **Identify the test file** — check if a `_test.go` file already exists for the target. If it does, append new test cases; if not, create a new one.

## Mocking rules

- **Unit tests only** — mocks/fakes are exclusively for unit tests. Integration or E2E tests must use real implementations.
- **Inline mock definitions** — define mock structs using `github.com/stretchr/testify/mock` in the same `_test.go` file or package, never in a separate mock package unless one already exists.
- **Per-case instantiation** — every test case in the table must instantiate and configure its own mock. Do not use shared `beforeEach`-style setup or `if/else` branching in the test body to decide what to configure. The table row is the single source of truth for what the harness looks like.

### testify/mock pattern

Embed `mock.Mock` and implement interface methods using `Called`. For the common `(Result, error)` return pattern, **never do a direct type assertion on the result** — use the comma-ok form for pointers, or a nil guard for value types, to avoid panics when the mock returns nil:

```go
type MockFoo struct {
    mock.Mock
}

// Pointer result — safe with comma-ok, returns nil without panic
func (m *MockFoo) GetThing(ctx context.Context, id string) (*Thing, error) {
    args := m.Called(ctx, id)
    res, _ := args.Get(0).(*Thing) // nil-safe: zero value (*Thing)(nil) if not set
    return res, args.Error(1)
}

// Value result — guard against nil before casting
func (m *MockFoo) ComputeThing(ctx context.Context, id string) (Thing, error) {
    args := m.Called(ctx, id)
    if v := args.Get(0); v != nil {
        return v.(Thing), args.Error(1)
    }
    return Thing{}, args.Error(1)
}
```

Each test case sets up expectations inline:

```go
{
    name: "returns error, nil result",
    setupMock: func() *MockFoo {
        m := &MockFoo{}
        m.On("GetThing", mock.Anything, "id-1").Return(nil, errors.New("boom"))
        return m
    },
},
{
    name: "success",
    setupMock: func() *MockFoo {
        m := &MockFoo{}
        m.On("GetThing", mock.Anything, "id-1").Return(&Thing{Name: "x"}, nil)
        return m
    },
},
```

After the test runs, always call `m.AssertExpectations(t)`.

- **Kubernetes** — for code using `kubernetes.Interface` or typed clientsets, use `k8s.io/client-go/kubernetes/fake.NewSimpleClientset(...)` seeded with the relevant objects directly in each test case. Do not mock the clientset itself.

## Test structure

Use table-driven tests for every function with more than one logical path:

```go
func TestFuncName(t *testing.T) {
    tests := []struct {
        name      string
        // inputs
        setupMock func() *MockDep  // one field per dependency
        // expected outputs
        wantErr   bool
    }{
        {
            name: "success",
            setupMock: func() *MockDep {
                m := &MockDep{}
                m.On("Method", mock.Anything).Return(&Result{}, nil)
                return m
            },
        },
        {
            name: "dep error",
            setupMock: func() *MockDep {
                m := &MockDep{}
                m.On("Method", mock.Anything).Return(nil, errors.New("boom"))
                return m
            },
            wantErr: true,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            dep := tt.setupMock()
            sut := NewSUT(dep)

            got, err := sut.DoWork(context.Background())

            if tt.wantErr {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
                assert.Equal(t, tt.want, got)
            }
            dep.AssertExpectations(t)
        })
    }
}
```

When testify is present:
- `require.NoError` / `require.Error` for error assertions that should stop the test
- `assert.Equal`, `assert.EqualError`, `assert.Nil`, etc. for non-fatal checks
- `require.ElementsMatch` or `assert.ElementsMatch` when slice order is non-deterministic

## Output

- Write all tests to the correct `_test.go` file (create or append as appropriate).
- Keep the test package consistent with the target (prefer `package foo_test` for black-box, `package foo` when access to unexported identifiers is necessary).
- Do not add comments that merely restate what the code does.
- Every import must be used, every type must satisfy its interface.