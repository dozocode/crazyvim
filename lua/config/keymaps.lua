-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true })
end

local keymap = vim.keymap.set

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Auto indent
keymap("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

-- move commands
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- remain cursor to stay in the same place
map("n", "J", "mzJ`z")

-- keep cursor in the middle when ctrl + d
-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "<C-u>", "<C-u>zz")

-- keeps search terms in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- deleting to void register
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- replace selected word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- splits
map("n", "<leader>sv", "<C-w>v")     -- split window vertically
map("n", "<leader>sh", "<C-w>s")     -- split window horizontally
map("n", "<leader>se", "<C-w>=")     -- make splut windows equal width
map("n", "<leader>sx", ":close<CR>") -- close current split window

-- tabs
map("n", "<leader>to", ":tabnew<CR>")   -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
map("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab

-- yanking
map("n", "<leader>ca", ":%y<CR>") -- yank all lines
map("n", "<leader>cap", "gg<S-v><S-g>p")

-- file explorer
-- map("n", "<leader>e", ":NeoTreeFocusToggle<CR>")

-- search resume
-- map("n", "<leader>sr", ":Telescope resume<CR>")

-- git signs
-- map("n", "<leader>gdt", ":Gitsigns diffthis<CR>") -- git show differents

-- Navigate buffers
-- map("n", "<S-h>", "<Plug>(cokeline-focus-prev)")
-- map("n", "<S-l>", "<Plug>(cokeline-focus-next)")
-- map("n", "<C-h>", "<Plug>(cokeline-switch-prev)")
-- map("n", "<C-l>", "<Plug>(cokeline-switch-next)")

-- close current buffer
map("n", "<Leader>q", ":Bdelete<CR>")

-- upload file to remote server
-- map("n", "<Leader>up", ":RsyncUpFile<CR>")

-- copilot
vim.api.nvim_set_keymap("i", "<M-w>", "copilot#Accept('<CR>')", { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-[>", "<Plug>(copilot-next)", { noremap = false })
vim.api.nvim_set_keymap("i", "<M-]>", "<Plug>(copilot-previous)", { noremap = false })

-- lsp
-- map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
-- map("n", "<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
-- map("n", "<leader>vr", ":lua vim.lsp.buf.references()<CR>")
-- map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>")
-- map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>")
