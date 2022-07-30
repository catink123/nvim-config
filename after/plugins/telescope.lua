-- Telescope configuration
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- Use TFB instead of netrw
      hijack_netrw = true
    }
  }
}

-- Load TFB
require("telescope").load_extension "file_browser" 
