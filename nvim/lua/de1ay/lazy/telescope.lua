return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "[S]earch [G]it files" })
        vim.keymap.set('n', '<leader>ss', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "[S]earch [S]tring" })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp" })
    end
}

