return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = { "c","lua","vim","vimdoc","query","javascript","typescript","tsx","css","html","json","c_sharp"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
