return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    config = function()
        vim.keymap.set("n", "<leader>M", "<cmd>Grapple toggle_tags<CR>", { desc = "Grapple: Toggle tags UI" })

        for c = string.byte("a"), string.byte("z") do
            local name = string.char(c)
            vim.keymap.set("n", "<leader>m" .. name, "<cmd>Grapple tag name=" .. name .. "<CR>", { desc = "Grapple: Tag as " .. name })
            vim.keymap.set("n", "<M-" .. name .. ">", "<cmd>Grapple select name=" .. name .. "<CR>", { desc = "Grapple: Select tag " .. name })
        end
    end
}
