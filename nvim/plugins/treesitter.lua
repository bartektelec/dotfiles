return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        "go",
        "gomod",
        "gowork",
        "gosum",
        "bash",
        "vimdoc",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "svelte",
        "elm",
        "css",
        "vim",
        "yaml",
      },
    },
  },
}
