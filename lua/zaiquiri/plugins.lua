-- Automatically install packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_confiocal packer_bootstrap = ensure_packer()g
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- Alpha start dashboard
    --[[ use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    } ]]
    -- Startify dashboard
    use 'mhinz/vim-startify'

    -- Quality of life
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim" -- Easily comment stuff
    -- use 'JoosepAlviste/nvim-ts-context-commentstring' -- Context specific commenting for stuff for example with js and jsx

    -- Colorschemes
    use "lunarvim/colorschemes" -- A bunch of colorschemes 
    use "lunarvim/darkplus.nvim"

    -- Lsp-zero
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},    -- enable LSP
            {'williamboman/mason.nvim'},  -- simple to use language server installer
            {'williamboman/mason-lspconfig.nvim'},  -- language server settings 

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- The completion plugin
            {'hrsh7th/cmp-buffer'},       -- buffer completions
            {'hrsh7th/cmp-path'},         -- path completion
            {'hrsh7th/cmp-cmdline'},      -- cmdline completions
            {'saadparwaiz1/cmp_luasnip'}, -- snippet completions
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},             --snippet engine
            {'rafamadriz/friendly-snippets'}, -- a bunch of snippets to use
        }
    }

    --- Navigation ---
    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "BurntSushi/ripgrep"      -- required for live_grep and grep_string
    -- Harpoon
    use("theprimeagen/harpoon")
    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    -- Nvim-tree
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons" -- adds the icons to the folders and files. also used in alot of other plugins

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Markdown Preview
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
