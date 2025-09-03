return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require('treesitter-context').setup({
            max_lines = 1
        })
        vim.keymap.set("n", "<leader>C", "<cmd>TSContext toggle<CR>")
    end
}
