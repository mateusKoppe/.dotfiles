local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

return {
  'kevinhwang91/nvim-ufo',
  dependencies = {'kevinhwang91/promise-async'},
  config = function ()
    local wk = require("which-key")
    local ufo = require("ufo")

    vim.o.foldcolumn = '0' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    wk.add({
      {"zR", ufo.openAllFolds, desc="open all folds"},
      {"zM", ufo.closeAllFolds, desc="close all folds"},
      {"zr", ufo.openFoldsExceptKinds, desc="open all but kinds"},
      {"zm", ufo.closeFoldsWith, desc="close folds with"}, -- closeAllFolds == closeFoldsWith(0)
    })

    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)

    require('ufo').setup({
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end
}
