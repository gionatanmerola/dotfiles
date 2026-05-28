-- ===========================================
-- EDITOR
-- ===========================================
vim.opt.number = true
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.swapfile = false

-- ===========================================
-- KEYMAPS
-- ===========================================
mapopts = { noremap = true, silent = true }

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", mapopts)
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", mapopts)
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", mapopts)
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", mapopts)

vim.keymap.set("n", "<C-s>", ":w<CR>", mapopts)
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", mapopts)

-- ===========================================
-- THEME
-- ===========================================
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }
require('catppuccin').setup({
  transparent_background = true,
})
vim.cmd("colorscheme catppuccin")

-- ===========================================
-- TELESCOPE
-- ===========================================
vim.pack.add({
  {
      src = "https://github.com/nvim-lua/plenary.nvim",
      name = "plenary",
  },
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    name = "telescope",
  },
})

local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<C-g>", telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- ===========================================
-- TELESCOPE
-- ===========================================
vim.pack.add({
  {
    src = "https://github.com/christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      --{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
})

-- ===========================================
-- LSP
-- ===========================================
vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { noremap = true, buffer = ev.buf }
    --local client = vim.lsp.get_client_by_id(ev.data.client_id)

    vim.keymap.set('n', '<F12>', vim.lsp.buf.definition, opts)

    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>kr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})

