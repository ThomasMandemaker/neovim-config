vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv = gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv = gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

local function check()
    local char = vim.api.nvim_get_current_line()
    local bruh = string.sub(char, 0, 2)
    print(bruh)
    if string.find(bruh, '/') == nill then
        return "^<C-v>I//<Esc>"
    else
        return "^<C-v>ld<Esc>"
    end
end

-- Very baasic auto comment
vim.keymap.set("v", "<C-/>", function() return check() end, {expr = true, noremap = false})
vim.keymap.set("n", "<C-/>", function() return check() end, {expr = true, noremap = false})

-- Run cargo build
vim.keymap.set("n", "<leader>c", ":!cargo run<CR>")
vim.keymap.set("n", "<leader>wc", ":w !cargo run<CR>")

-- Tab navigation
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>");
vim.keymap.set("n", "<leader>ts", ":tab split<CR>");
vim.keymap.set("n", "<C-}>", ":tabnext<CR>");
vim.keymap.set("n", "<C-{>", ":tabp<CR>");

-- Only show messages on ERROR
vim.diagnostic.config({virtual_text={severity=vim.diagnostic.severity.ERROR}})

-- LSP remap
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
