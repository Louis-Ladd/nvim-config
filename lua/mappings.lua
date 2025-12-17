--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: mappings.lua
-- Description: Key mapping configs
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>


-- <leader> is a space now
local map = vim.keymap.set

map("n", "<leader>q", ":qa!<CR>", {})

map("v", "<leader>y", '"+y')

-- Open new terminal window
map("n", "<leader>wt", ":terminal<CR>", { desc = "Open a terminal" })
-- Exit terminal window without two combos
map("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>", {})
-- Move around splits
map("n", "<leader>wh", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "switch window right" })
map("n", "<leader>wk", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "switch window down" })
map("n", "<leader>ww", "<C-w>w", { desc = "switch window" })
map("n", "<leader>ws", ":vsplit<CR>", { desc = "split window vertically" })

-- Oil
map("n", "<leader>fd", "<CMD>Oil<CR>", { desc = "Open Oil directory browser"})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Open Telescope to find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Open Telescope to do live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Open Telescope to show help" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Open Telescope to list recent files" })
map("n", "<leader>cm", builtin.git_commits, { desc = "Open Telescope to list git commits" })

-- LSP
map("n", "<leader>gm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })
-- Show code action
map("n", "<leader>ga", function()
  vim.lsp.buf.code_action()
end, { desc = "Show code action for error" })
-- Actually apply code action
map("n", "<leader>gf", function()
  vim.lsp.buf.code_action(
    {
      filter = function(a) return a.isPreferred end,
      apply = true
    })
end, { desc = "Apply preferred code action" })
-- Goto definition
map("n", "<leader>gd", function() vim.lsp.buf.definition() end,
  { desc = "goto definition", noremap = true, silent = true })


-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- Comment
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })
map("v", "mm", "gc", { desc = "Toggle comment", remap = true })
