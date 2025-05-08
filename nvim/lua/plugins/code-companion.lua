return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Organized adapter configurations
    adapters = {
      -- Anthropic/Claude adapter
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op read op://Employee/Anthropic_API/credential --no-newline",
          },
        })
      end,

      -- Copilot adapter with Claude model
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,

      -- Gemini adapter
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:op read op://Employee/Gemini_API/credential --no-newline",
          },
        })
      end,

      -- OpenAI adapter
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          opts = {
            stream = true,
          },
          env = {
            api_key = "cmd:op read op://Employee/OpenAI_API/credential --no-newline",
          },
          schema = {
            model = {
              default = function()
                return "gpt-4o"
              end,
            },
          },
        })
      end,
    },

    -- Strategy configurations
    strategies = {
      -- Chat strategy using Copilot adapter
      chat = {
        adapter = "anthropic",
        -- roles = {
        --   user = "jgantunes",
        -- },
        -- Uncomment to enable VectorCode integration
        -- tools = {
        --   vectorcode = {
        --     description = "Run VectorCode to retrieve the project context.",
        --     callback = function()
        --       return require("vectorcode.integrations").codecompanion.chat.make_tool()
        --     end,
        --   },
        -- },
      },

      -- Other strategies
      inline = { adapter = "anthropic" },
      agent = { adapter = "anthropic" },
    },
  },
}
