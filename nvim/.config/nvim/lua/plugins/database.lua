return {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  {

    "kristijanhusak/vim-dadbod-completion",
    config = function ()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
          "mysql",
          "plsql"
        },
        callback = function ()
          require('cmp').setup.buffer({
            sources = {{
              name = 'vim-dadbod-completion'
            }}
          })
        end
      })
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
    }
  }
}
