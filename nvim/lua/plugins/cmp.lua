return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "onsails/lspkind-nvim",
    'hrsh7th/cmp-nvim-lsp',
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require('lspkind')
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local source_mapping = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      -- cmp_tabnine = "[TN]",
      path = "[Path]",
    }

    cmp.setup({
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]
          local menu = source_mapping[entry.source.name]
          -- if entry.source.name == 'cmp_tabnine' then
          --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          --     menu = entry.completion_item.data.detail .. ' ' .. menu
          --   end
          --   vim_item.kind = ''
          -- end
          vim_item.menu = menu
          return vim_item
        end
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<CR>'] = function(fallback)
          if not cmp.visible() or not cmp.get_selected_entry() or
              cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
            fallback()
          else
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            })
          end
        end
      },
      sources = cmp.config.sources({
        { name = "copilot",  group_index = 1 },
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'luasnip',  max_item_count = 5, group_index = 1 }, -- For vsnip users.
      }, {
        { name = 'path',   group_index = 1 },
        { name = 'buffer', keyword_length = 3, group_index = 2 },
      })
    })

    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
    -- bug: if you're using TAB for copilot, the below config will block both if both copilot and cmp is available
    -- cmp.event:on("menu_opened", function()
    --   vim.b.copilot_suggestion_hidden = true
    -- end)

    -- cmp.event:on("menu_closed", function()
    --   vim.b.copilot_suggestion_hidden = false
    -- end)
  end
}
