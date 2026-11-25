<p align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width="80" />
</p>

<h1 align="center">nvim-config</h1>

<p align="center">
  <b>A modular Neovim configuration for C/C++, Python, Rust, and more.</b><br>
  Built on Neovim 0.11+ with native LSP, tree-sitter, and DAP.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.11%2B-57A143?style=flat-square&logo=neovim&logoColor=white" />
  <img src="https://img.shields.io/badge/Lua-Plugin%20Config-2C2D72?style=flat-square&logo=lua&logoColor=white" />
  <img src="https://img.shields.io/badge/Theme-Darcula%20Solid-FE8019?style=flat-square" />
  <img src="https://img.shields.io/badge/License-MIT-blue?style=flat-square" />
</p>

---

## Features

- **One-command install** — clone and open `nvim`, everything bootstraps automatically
- **Modular layout** — one file per plugin, easy to add/remove/modify
- **Full IDE experience** — autocompletion, go-to-definition, rename, code actions, diagnostics
- **Integrated debugger** — step through C/C++, Rust, and Python with a visual debug UI
- **Fuzzy finding** — files, grep, buffers, symbols, diagnostics all searchable
- **Git integration** — gutter signs, hunk staging/reset, inline blame
- **LaTeX editing** — live compilation with latexmk + Skim preview
- **LLVM IR support** — custom syntax highlighting for `.ll` files
- **JetBrains-style theme** — Darcula Solid colorscheme

---

## Install

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone
git clone https://github.com/JasveerD/nvim-config.git ~/.config/nvim

# Launch — plugins install automatically
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself and installs all plugins. [Mason](https://github.com/williamboman/mason.nvim) then installs LSP servers and debug adapters.

---

## Structure

```
~/.config/nvim/
├── init.lua                  Entry point
├── lua/
│   ├── options.lua           Editor settings
│   ├── keymaps.lua           Key mappings
│   ├── filetypes.lua         Custom filetype detection
│   └── plugins/
│       ├── colorscheme.lua   Theme
│       ├── telescope.lua     Fuzzy finder
│       ├── treesitter.lua    Syntax highlighting
│       ├── lualine.lua       Statusline
│       ├── nvim-tree.lua     File explorer
│       ├── gitsigns.lua      Git signs
│       ├── comment.lua       Commenting
│       ├── autopairs.lua     Auto-close pairs
│       ├── indent.lua        Indent guides
│       ├── which-key.lua     Keymap hints
│       ├── cmp.lua           Autocompletion
│       ├── mason.lua         Package installer
│       ├── lsp.lua           Language servers
│       ├── dap.lua           Debugger
│       ├── vimtex.lua        LaTeX
│       └── bufferline.lua    Buffer tabs
├── lsp/
│   ├── clangd.lua            clangd config
│   └── prolog_ls.lua         SWI-Prolog config
└── syntax/
    └── llvm.vim              LLVM IR highlighting
```

---

## Language Support

| Language | LSP | Debugger | Syntax |
|:---------|:----|:---------|:-------|
| C / C++ | clangd | codelldb | tree-sitter |
| Python | pyright | debugpy | tree-sitter |
| Rust | rust_analyzer | codelldb | tree-sitter |
| Lua | lua_ls | — | tree-sitter |
| LLVM IR | — | — | custom vim syntax |
| LaTeX | — | — | vimtex |
| Prolog | prolog_ls | — | tree-sitter |
| Assembly | asm_lsp | — | tree-sitter |

---

## Key Mappings

Leader key: **`Space`**

> Tip: press `Space` and wait — [which-key](https://github.com/folke/which-key.nvim) will show all available mappings.

### General

| Key | Action |
|:----|:-------|
| `Space` `w` | Save |
| `Space` `q` | Quit |
| `Space` `e` | Toggle file explorer |
| `Esc` | Clear search highlight |
| `Ctrl` `h/j/k/l` | Navigate windows |
| `Shift` `h` / `Shift` `l` | Previous / next buffer |
| `Space` `bd` | Close buffer |
| `J` / `K` (visual) | Move selection down / up |
| `Ctrl` `d` / `Ctrl` `u` | Scroll down / up (centered) |

### Find

| Key | Action |
|:----|:-------|
| `Ctrl` `p` | Find files |
| `Space` `fg` | Live grep |
| `Space` `fb` | Open buffers |
| `Space` `fh` | Help tags |
| `Space` `fr` | Recent files |
| `Space` `fc` | Commands |
| `Space` `fd` | Diagnostics |
| `Space` `/` | Fuzzy search in current buffer |

### LSP

| Key | Action |
|:----|:-------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `Space` `lr` | Rename symbol |
| `Space` `la` | Code action |
| `Space` `lf` | Format buffer |
| `Space` `ls` | Document symbols |
| `Space` `lw` | Workspace symbols |
| `Space` `lt` | Type definition |
| `Space` `ld` | Diagnostic float |
| `[d` / `]d` | Previous / next diagnostic |

### Debug

| Key | Action |
|:----|:-------|
| `Space` `db` | Toggle breakpoint |
| `Space` `dB` | Conditional breakpoint |
| `Space` `dc` | Continue / start |
| `Space` `do` | Step over |
| `Space` `di` | Step into |
| `Space` `dO` | Step out |
| `Space` `dr` | Restart session |
| `Space` `dt` | Terminate |
| `Space` `dl` | Run last configuration |
| `Space` `du` | Toggle debug UI |
| `Space` `de` | Evaluate expression |

### Git

| Key | Action |
|:----|:-------|
| `]h` / `[h` | Next / previous hunk |
| `Space` `hs` | Stage hunk |
| `Space` `hr` | Reset hunk |
| `Space` `hp` | Preview hunk |
| `Space` `hb` | Blame current line |

---

## Plugins

All plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and auto-install on first launch.

### Core

| Plugin | Purpose | Author |
|:-------|:--------|:-------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager | folke |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP / DAP / linter installer | williamboman |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason and lspconfig | williamboman |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Bridges mason and nvim-dap | jay-babu |

### Editor

| Plugin | Purpose | Author |
|:-------|:--------|:-------|
| [darcula-solid.nvim](https://github.com/briones-gabriel/darcula-solid.nvim) | JetBrains Darcula colorscheme | briones-gabriel |
| [lush.nvim](https://github.com/rktjmp/lush.nvim) | Colorscheme framework (darcula dep) | rktjmp |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting + text objects | nvim-treesitter |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | nvim-telescope |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for telescope | nvim-telescope |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | Native select UI via telescope | nvim-telescope |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library | nvim-lua |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer | nvim-tree |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Tab-style buffer bar | akinsho |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline | nvim-lualine |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons | nvim-tree |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guide lines | lukas-reineke |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap discovery popup | folke |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Toggle comments | numToStr |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets and quotes | windwp |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs + hunk actions | lewis6991 |

### LSP & Completion

| Plugin | Purpose | Author |
|:-------|:--------|:-------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configurations | neovim |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine | hrsh7th |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source | hrsh7th |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer words completion | hrsh7th |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | File path completion | hrsh7th |
| [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) | Function signature hints | hrsh7th |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine | L3MON4D3 |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet completion source | saadparwaiz1 |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection | rafamadriz |

### Debug

| Plugin | Purpose | Author |
|:-------|:--------|:-------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client | mfussenegger |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI (variables, stack, REPL) | rcarriga |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async I/O library (dap-ui dep) | nvim-neotest |

### LaTeX

| Plugin | Purpose | Author |
|:-------|:--------|:-------|
| [vimtex](https://github.com/lervag/vimtex) | LaTeX editing, compilation, preview | lervag |

---

## External Dependencies

These are **not** installed automatically. Install what you need:

### Required

```bash
# macOS
brew install neovim node npm ripgrep fd
```

### Optional

```bash
# LaTeX
brew install --cask mactex skim
brew install latexmk

# Prolog
brew install swi-prolog

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

---

## License

MIT
