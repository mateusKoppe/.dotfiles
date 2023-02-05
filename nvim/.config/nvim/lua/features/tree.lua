function mysplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local function telescope(node, type)
  local path = (node.type == "directory") and node._id or node._parent_id

  local name = mysplit(node.id, "/")
  name = { table.unpack(name, #name - node.level + 1, #name - (node.type == "file" and 1 or 0)) }
  name = table.concat(name, "/")

  local actions = {
    ["live_grep"] = function()
      require('telescope.builtin').live_grep({
        search_dirs = { path },
        prompt_title = "Live Grep: " .. name
      })
    end,

    ["find_files"] = function()
      require('telescope.builtin').find_files({
        search_dirs = { path },
        prompt_title = "Find Files: " .. name
      })
    end

  }

  actions[type]()

end

local M = {
  active = true,

  package = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },

        git_status = {
          symbols = {
            -- Change type
            added    = "A",
            modified = "M",
            deleted  = "D",
            renamed  = "R",

            -- Status type
            untracked = "?",
            ignored   = "i",
            unstaged  = "?",
            staged    = "!",
            conflict  = "C",
          }
        },
      },

      window = {
        position = "right",
        width = 36,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          o = "open",
          H = "prev_source",
          L = "next_source",
        },
      },

      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            O = "system_open",
            h = "toggle_hidden",
            F = function(state)
              telescope(state.tree:get_node(), "find_files")
            end,
            Q = function(state)
              telescope(state.tree:get_node(), "live_grep")
            end,

          },
        },

        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
        }
      },

      source_selector = {
        winbar = true,
        statusline = false
      }
    })

    local wk = require("which-key")

    wk.register({
      ["<leader>"] = {
        e = {
          name = "+Explorer",
          e = { "<cmd>NeoTreeFocus<cr>", "Focus" },
          o = { "<cmd>NeoTreeShowToggle<cr>", "Togle" },
          f = { "<cmd>NeoTreeFloat<cr>", "Float" },
        },
      },
    })
  end
}

return M
