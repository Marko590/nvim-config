return {
  "windwp/nvim-ts-autotag",
  opts={
  
      enable_close_on_slash = true
  },
  config = function()
    require("nvim-ts-autotag").setup({
    })
  end
}

