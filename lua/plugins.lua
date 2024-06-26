local api = vim.api
local cmp = require "cmp"
api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", {noremap = true})

cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            end
        },
        window = {},
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"}
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

cmp.setup.cmdline(
    {"/", "?"},
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        ),
        matching = {disallow_symbol_nonprefix_matching = false}
    }
)

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require("lspconfig")

local function setup_lsp(server)
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

setup_lsp("lua_ls")
setup_lsp("bashls")
setup_lsp("gopls")

