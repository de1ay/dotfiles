return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.8",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.have_nerd_font
    }
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "[S]earch [G]it files" })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = "[S]earch [S]tring" })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp" })
  end
}
