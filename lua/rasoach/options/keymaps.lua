
local opts = { noremap = true, silent = true }

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- keymap configs start here
local keymap = vim.api.nvim_set_keymap

-- remap Space as Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"


-- file-explore using nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- packer
keymap("n", "<leader>ps", ":PackerStatus<CR>", opts)
keymap("n", "<leader>py", ":PackerSync<CR>", opts)


-- checkhealth
keymap("n", "<leader>c", ":checkhealth<CR>", opts)

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", opts) -- increment
keymap("n", "<leader>-", "<C-x>", opts) -- decrement

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Working with Tabs
keymap("n", "<leader>t", ":tabnew<CR>", opts)     -- open new Tab
keymap("n", "<leader>x", ":tabclose<CR>", opts)   -- close Tab
keymap("n", "<leader>n", ":tabn<CR>", opts)       -- go to the next Tab
keymap("n", "<leader>p", ":tabp<CR>", opts)       -- go to the previous Tab


-- telescope
keymap("n", "<leader><Up>", ":Telescope find_files<CR>", opts)    -- find files
keymap("n", "<leader><Down>", ":Telescope live_grep<CR>", opts)       -- go to the previous Tab
-- keymap("n", "<leader>p", ":tabp<CR>", opts)       -- go to the previous Tab

-- null-ls
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

-- zenMode
keymap("n", "<leader>z", ":ZenMode<CR>", opts)       -- zenMode Toggle 


