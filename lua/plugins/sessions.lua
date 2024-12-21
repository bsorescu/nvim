return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      auto_session_suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      session_lens = {
        buffer_to_ignore = {},
        load_on_setup = true, -- Initialize on startup (requires Telescope)
        theme_conf = { border = true },
        previewer = false, -- Disable previewer
      },
      vim.keymap.set("n", "<Lader>ls", require('auto-session.session_lens').search_session, {
        noremap = true,
      }),
    })
  end,
}
