local globals = {
  mapleader = " ",            --- Map leader key to SPC
  speeddating_no_mappings = 1, --- Disable default mappings for speeddating
}

local options = {
  clipboard = "unnamed,unnamedplus",    --- Copy-paste between vim and everything else
  cmdheight = 1,                        --- Give more space for displaying messages
  completeopt = "menu,menuone,noselect", --- Better autocompletion
  cursorline = true,                    --- Highlight of current line
  emoji = false,                        --- Fix emoji display
  foldcolumn = "0",
  foldnestmax = 0,
  foldlevel = 99,                 --- Using ufo provider need a large value
  foldlevelstart = 99,            --- Expand all folds by default
  ignorecase = true,              --- Needed for smartcase
  laststatus = 3,                 --- Have a global statusline at the bottom instead of one for each window
  mouse = "a",                    --- Enable mouse
  number = true,                  --- Shows current line number
  pumheight = 10,                 --- Max num of items in completion menu
  relativenumber = true,          --- Enables relative number
  scrolloff = 8,                  --- Always keep space when scrolling to bottom/top edge
  showtabline = 0,                --- Never display the tabline, regardless of the number of tabs
  signcolumn = "yes:2",           --- Add extra sign column next to line number
  smartcase = true,               --- Uses case in search

  expandtab = true,               --- Use spaces instead of tabs
  autoindent = true,              --- Good auto indent
  smartindent = true,             --- Makes indenting smart
  smarttab = true,                --- Makes tabbing smarter will realize you have 2 vs 4
  shiftwidth = 2,                 --- Change a number of space characters inserted for indentation
  softtabstop = 2,                --- Insert 2 spaces for a tab
  tabstop = 2,                    --- Insert 2 spaces for a tab
  wrap = false,                   --- Display long lines as just one line

  splitright = true,              --- Vertical splits will automatically be to the right
  swapfile = false,               --- Swap not needed
  termguicolors = true,           --- Correct terminal colors
  timeoutlen = 400,               --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile = true,                --- Sets undo to file
  updatetime = 100,               --- Faster completion
  viminfo = "'1000",              --- Increase the size of file history
  wildignore = "*node_modules/**", --- Don't search inside Node.js modules (works for gutentag)
  writebackup = false,            --- Not needed

  -- Neovim defaults
  backspace = "indent,eol,start", --- Making sure backspace works
  backup = false,                --- Recommended by coc

  --- Concealed text is completely hidden unless it has a custom replacement character defined (needed for dynamically showing tailwind classes)
  conceallevel = 0,      -- show double quotes in json file
  concealcursor = "",    --- Set to an empty string to expand tailwind class when on cursorline
  encoding = "utf-8",    --- The encoding displayed
  errorbells = false,    --- Disables sound effect for errors
  fileencoding = "utf-8", --- The encoding written to file
  incsearch = true,      --- Start searching before pressing enter
  showmode = false,      --- Don't show things like -- INSERT -- anymore
  title = false,
  hlsearch = false,
  showcmd = true,
  backupskip = { "/tmp/*", "/private/tmp/*" },
  inccommand = "split",
  breakindent = true,
  autoread = true,
}

vim.opt.shortmess:append("c")
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.formatoptions:append({ "r" })
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Fold (UFO plugin)
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

for k, v in pairs(globals) do
  vim.g[k] = v
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Override the nvim python.vim plugin
-- located at /opt/homebrew/Cellar/neovim/0.9.4/share/nvim/runtime/ftplugin/python.vim
vim.cmd([[au FileType python set noexpandtab]])
vim.cmd([[au FileType python set shiftwidth=4]])
vim.cmd([[au FileType python set softtabstop=4]])
vim.cmd([[au FileType python set tabstop=4]])
