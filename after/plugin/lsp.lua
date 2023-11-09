
local on_attach = function(_, bufnr)

	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, { buffer = bufnr })
	end

	bufmap('<leader>r', vim.lsp.buf.rename)
	bufmap('<leader>a', vim.lsp.buf.code_action)

	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)

	bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
	-- bufmap('<leader>ff', require('telescope.builtin').find_files)
	-- bufmap('<leader>fg', require('telescope.builtin').live_grep)
	-- bufmap('<leader>fb', require('telescope.builtin').buffers)
	bufmap('K', vim.lsp.buf.hover)

	bufmap('<leader>f', function() vim.lsp.buf.format { async = true } end)
	bufmap('<leader>F', vim.lsp.buf.code_action)

	bufmap('<leader>rn', vim.lsp.buf.rename)

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

	["lua_ls"] = function()
		require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            }
        }
    end,
	["pyright"] = function()
        require('lspconfig').pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = require('lspconfig').util.root_pattern('.git'),
            settings = {
				pyright = {
					disableLanguageServices = false,
					disableOrganizeImports = true
				},
				python = {
					analysis = {
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "workspace", -- openFilesOnly, workspace
						typeCheckingMode = "basic", -- off, basic, strict
						useLibraryCodeForTypes = true
				  	}
				}
			}
        }
    end,
	["ruff_lsp"] = function()
        require('lspconfig').ruff_lsp.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = require('lspconfig').util.root_pattern('.git'),
        }
    end,
})

