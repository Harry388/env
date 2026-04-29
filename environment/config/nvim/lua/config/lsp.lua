vim.lsp.enable({
    "rust_analyzer",
    "gopls",
    -- "ts_ls",
    -- "vue_ls",
    -- "vtsls",
    "tailwindcss",
    "superhtml",
    "zls",
    "elixirls",
    "bashls",
    "fish_lsp",
    "intelephense",
    "gleam",
    "emmet_ls",
})

-- local vue_plugin = {
--     name = '@vue/typescript-plugin',
--     location = "",
--     languages = { 'vue' },
--     configNamespace = 'typescript',
-- }
-- vim.lsp.config('vtsls', {
--     settings = {
--         vtsls = {
--             tsserver = {
--                 globalPlugins = {
--                     vue_plugin,
--                 },
--             },
--         },
--     },
--     filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- })

vim.diagnostic.config({
    virtual_text = true,
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) 
        vim.keymap.set("n", "gD", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>fws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>dv", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

        vim.keymap.set("n", "<leader>j", function() vim.diagnostic.jump({ count =  1 }) end, opts)
        vim.keymap.set("n", "<leader>k", function() vim.diagnostic.jump({ count = -1 }) end, opts)
    end
})
