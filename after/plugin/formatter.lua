local util = require "formatter.util"


require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {

    lua = {
      require("formatter.filetypes.lua").stylua
    },

    css = {
        require("formatter.filetypes.css").prettier
    },
    vue = {
        require("formatter.filetypes.vue").prettier
    },
    javascript = {
        require("formatter.filetypes.javascript").prettier
    },
    html = {
        require("formatter.filetypes.html").prettier
    },
    python = {
        require("formatter.filetypes.python").isort,
        require("formatter.filetypes.python").ruff,
        
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
      vim.lsp.buf.format({ async = true })
    }
  }
}

vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = "FormatAutogroup",
    command = "FormatWrite",
})
