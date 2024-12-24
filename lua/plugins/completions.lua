return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",   -- Buffer completions
      "hrsh7th/cmp-path",     -- Path completions
      "hrsh7th/cmp-vsnip",    -- Snippet completions
      "hrsh7th/vim-vsnip",    -- Snippet engine
    },
  },
  {
      "mattn/emmet-vim",
      config = function()
        vim.g.user_emmet_leader_key = "<C-y>" -- Trigger Emmet with Ctrl-y
      end,
  },
  {
    "mhinz/vim-startify", -- Useful for creating templates
    config = function()
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.html",
        callback = function()
          vim.cmd("0r ~/.config/nvim/templates/html.skeleton")
        end,
      })
    end,
  },
  {
    "github/copilot.vim"
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      --require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
