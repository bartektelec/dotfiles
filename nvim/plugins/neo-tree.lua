return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    vscode = true,
    opts = {
      open_files_do_not_replace_types = { "trouble", "qf" },
      filesystem = {
        use_libuv_file_watcher = false,
      },
      window = {
        position = "right",
      },
    },
  },
}
