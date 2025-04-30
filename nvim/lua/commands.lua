local m = require("mapx")

-- TODO refactor this file

-- save on enter in normal mode
m.nmap("<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", "expr")

-- no highlight
m.nmap("<leader>nh", ":noh<CR>")

-- close panel hotkey
m.nmap("<leader>wq", "<C-w>q")

-- remaps paste to delete then paste first
m.xnoremap("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "silent")

-- remove J mapping
m.map("J", "<Nop>")

-- buffers
m.nmap("[b", ":bprevious<CR>", "silent")
m.nmap("]b", ":bnext<CR>", "silent")
m.nmap("[B", ":bfirst<CR>", "silent")
m.nmap("]B", ":blast<CR>", "silent")

m.nmap("<leader>ut", ":UndotreeShow<CR>")

-- telescope mappings
m.nmap("<C-f>", "<cmd>Telescope find_files<cr>")

m.nmap("<C-g>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_raw()<cr>")

m.nmap("<C-b>", "<cmd>Telescope buffers<cr>")

m.nmap("<C-t>", "<cmd>Telescope resume<cr>")

-- Cheatsheet
m.nmap("<leader>cs", ":Cheatsheet<CR>")

-- insert line without taking formatting from current line
m.nnoremap("<Leader>o", "o<Esc>^Da")
m.nnoremap("<Leader>O", "O<Esc>^Da")

-- Fugitive
m.nmap("<leader>gs", ":G<CR>")
-- dd to resolve conflict on file in gs
m.nmap("<leader>gh", ":diffget //3<CR>")
m.nmap("<leader>gu", ":diffget //2<CR>")
m.nmap("gs", ":Gdiffsplit<CR>")

-- Node run file
m.nmap("<leader>sr", ":!node %<CR>")

-- Jest
m.nmap("<leader>tf", ":JestFile<CR>", "silent")
m.nmap("<leader>ts", ":JestSingle<CR>", "silent")
m.nmap("<leader>ts", ":JestSingle<CR>", "silent")

-- persisted nvim
m.nmap("<leader>st", ":SessionToggle<cr>")

-- spectre
m.nnoremap("<leader>S", "<cmd>lua require('spectre').open()<CR>")

-- disable q:
m.map("Q", "<Nop>")
-- can't disable q: so disable q instead
-- m.map("q", "<Nop>")

-- Format file using built in lsp
-- vim.api.nvim_create_user_command('Format', function()
--   require("conform").format({ bufnr = args.buf })
--   vim.api.nvim_command(':lua vim.lsp.buf.format { async = true }')
-- end, { nargs = 0 })

m.nmap("gf", "<cmd>Lspsaga finder<CR>")
m.nmap({ "n", "v" }, "<leader>ga", "<cmd>Lspsaga code_action<CR>")
m.nmap("gr", "<cmd>Lspsaga rename<CR>")
m.nmap("grp", "<cmd>Lspsaga rename ++project<CR>")
-- <C-t> to go back to previous
m.nmap("gd", "<cmd>Lspsaga goto_definition<CR>")

m.nmap("<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
m.nmap("<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
m.nmap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

m.nmap("[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
m.nmap("]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- Diagnostic jump with filters such as only jumping to an error
m.nmap("[G", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
m.nmap("]G", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

m.nmap("K", "<cmd>Lspsaga hover_doc<CR>")
-- Call hierarchy
m.nmap("<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
m.nmap("<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Buffer barbar.nvim
m.nnoremap("<A-,>", "<Cmd>BufferPrevious<CR>", "silent")
m.nnoremap("<A-.>", "<Cmd>BufferNext<CR>", "silent")

m.nnoremap("<A-1>", "<Cmd>BufferGoto 1<CR>", "silent")
m.nnoremap("<A-2>", "<Cmd>BufferGoto 2<CR>", "silent")
m.nnoremap("<A-3>", "<Cmd>BufferGoto 3<CR>", "silent")
m.nnoremap("<A-4>", "<Cmd>BufferGoto 4<CR>", "silent")
m.nnoremap("<A-5>", "<Cmd>BufferGoto 5<CR>", "silent")
m.nnoremap("<A-6>", "<Cmd>BufferGoto 6<CR>", "silent")
m.nnoremap("<A-7>", "<Cmd>BufferGoto 7<CR>", "silent")
m.nnoremap("<A-8>", "<Cmd>BufferGoto 8<CR>", "silent")
m.nnoremap("<A-9>", "<Cmd>BufferGoto 9<CR>", "silent")
m.nnoremap("<A-0>", "<Cmd>BufferLast<CR>", "silent")

-- " Pin/unpin buffer
-- nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
m.nnoremap("<A-p>", "<Cmd>BufferPin<CR>", "silent")

-- " Close buffer
-- nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
m.nnoremap("<A-c>", "<Cmd>BufferClose<CR>", "silent")

m.nnoremap("<Leader>bc", "<Cmd>BufferCloseAllButCurrent<CR>", "silent")
m.nnoremap("<Leader>bv", "<Cmd>BufferCloseAllButVisible<CR>", "silent")
m.nnoremap("<Leader>bp", "<Cmd>BufferCloseAllButPinned<CR>", "silent")
m.nnoremap("<Leader>bl", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", "silent")
m.nnoremap("<Leader>br", "<Cmd>BufferCloseBuffersRight<CR>", "silent")

m.nnoremap("<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", "silent")

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "FormatEnable",
})

m.nmap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
m.nmap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
m.nmap("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
m.nmap("n", "<c-n>", "<Plug>(YankyNextEntry)")

m.nnoremap("<Leader>yh", "<Cmd>YankyRingHistory<CR>", "silent")

m.nmap("n", "<leader>cco", ":CopilotChatOpen<CR>")
m.nmap("n", "<leader>ccm", ":CopilotChatClose<CR>")
m.nmap("n", "<leader>ccp", ":CopilotChatPrompts<CR>")
