return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier", stop_after_first = true },
            typescript = { "prettier", stop_after_first = true },
            vue = { "prettier", stop_after_first = true },
        },
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = 'never'
            else
                lsp_format_opt = 'fallback'
            end
            return {
                timeout_ms = 1000,
                lsp_format = lsp_format_opt,
            }
        end
    }
}
