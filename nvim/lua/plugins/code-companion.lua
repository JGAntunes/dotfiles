return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- History management
    "ravitemer/codecompanion-history.nvim",
  },
  opts = {
    extensions = {
      history = {
        enabled = true,
        opts = {
          -- Keymap to open history from chat buffer (default: gh)
          keymap = "<leader>gh",
          -- Keymap to save the current chat manually (when auto_save is disabled)
          save_chat_keymap = "<leader>sc",
          -- Save all chats by default (disable to save only manually using 'sc')
          auto_save = true,
          -- Number of days after which chats are automatically deleted (0 to disable)
          expiration_days = 100,
          -- Picker interface (auto resolved to a valid picker)
          picker = "telescope", --- ("telescope", "snacks", "fzf-lua", or "default")
          ---Optional filter function to control which chats are shown when browsing
          chat_filter = nil, -- function(chat_data) return boolean end
          -- Customize picker keymaps (optional)
          picker_keymaps = {
            rename = { n = "r", i = "<M-r>" },
            delete = { n = "d", i = "<M-d>" },
            duplicate = { n = "<C-y>", i = "<C-y>" },
          },
          ---Automatically generate titles for new chats
          auto_generate_title = true,
          ---On exiting and entering neovim, loads the last chat on opening chat
          continue_last_chat = true,
          ---When chat is cleared with `gx` delete the chat from history
          delete_on_clearing_chat = false,
          ---Directory path to save the chats
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          ---Enable detailed logging for history extension
          enable_logging = false,

          -- Summary system
          summary = {
            -- Keymap to generate summary for current chat (default: "gcs")
            create_summary_keymap = "<leader>gcs",
            -- Keymap to browse summaries (default: "gbs")
            browse_summaries_keymap = "<leader>gbs",
            generation_opts = {
              adapter = nil, -- defaults to current chat adapter
              model = nil, -- defaults to current chat model
              context_size = 90000, -- max tokens that the model supports
              include_references = true, -- include slash command content
              include_tool_outputs = true, -- include tool execution results
              system_prompt = nil, -- custom system prompt (string or function)
              format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
            },
          },
        },
      },
    },
    -- Organized adapter configurations
    adapters = {
      -- Anthropic/Claude adapter
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op read op://Employee/Anthropic_API/credential --no-newline",
          },
          model = "claude-sonnet-4-20250514",
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
