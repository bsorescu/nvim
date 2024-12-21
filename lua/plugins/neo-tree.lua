return  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
      vim.keymap.set('n', '<leader>th', function()
        vim.cmd('Neotree filesystem toggle')
      end, { noremap = true, silent = true, desc = "Toggle Neo-tree hidden files" })
      filesystem = {
        filtered_items = {
            visible = true,      -- Show hidden files
            hide_dotfiles = false, -- Do not hide dotfiles (files starting with .)
            hide_gitignored = false, -- Show git-ignored files
        },
      }
    end
  }


