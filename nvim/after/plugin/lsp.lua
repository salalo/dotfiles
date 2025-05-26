local cmp = require('cmp')
local lsp_zero = require('lsp-zero')
-- local cmp_action = require('lsp-zero').cmp_action()

local lsp_attach = function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end

lsp_zero.extend_lspconfig({
  lsp_attach = lsp_attach,
})

cmp.setup({
	sources = {
    {name = 'copilot'},
		{name = 'nvim_lsp'},
	},
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false}),
		-- ['<Tab>'] = cmp_action.luasnip_supertab(),
		-- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

-- language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'ts_ls', 'rust_analyzer', 'eslint', 'cssmodules_ls', 'html', 'tailwindcss', 'elixirls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
