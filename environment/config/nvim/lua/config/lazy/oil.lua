return {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function ()
        require("oil").setup({
            columns = {
                "icon",
                -- "permissions",
                -- "mtime"
            }
        })
        vim.keymap.set("n", "-", "<cmd>Oil<CR>")
    end
}
