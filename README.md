# Neovim Config

Personal Neovim configuration for Neovim 0.11+.

## Install

Back up your existing config (if any), then clone:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/JasveerD/nvim-config.git ~/.config/nvim
```

Open `nvim` — lazy.nvim bootstraps itself and installs all plugins automatically on first launch. Mason will install LSP servers and debug adapters.

## Structure

```
init.lua              -- Entry point: options, lazy bootstrap, requires
lua/
  options.lua         -- Editor settings (tabs, line numbers, clipboard, etc.)
  keymaps.lua         -- Key mappings
  filetypes.lua       -- Custom filetype detection (asm, prolog, llvm)
  plugins/
    colorscheme.lua   -- Darcula Solid (JetBrains-style theme)
    telescope.lua     -- Fuzzy finder + fzf + ui-select
    treesitter.lua    -- Syntax highlighting via tree-sitter
    lualine.lua       -- Statusline
    nvim-tree.lua     -- File explorer
    gitsigns.lua      -- Git gutter signs
    comment.lua       -- Toggle comments (gcc / gc)
    autopairs.lua     -- Auto-close brackets/quotes
    indent.lua        -- Indent guide lines
    which-key.lua     -- Keymap hints popup
    cmp.lua           -- Autocompletion + snippets
    mason.lua         -- LSP/DAP installer
    lsp.lua           -- LSP configuration + diagnostics
    dap.lua           -- Debug Adapter Protocol + UI
    vimtex.lua        -- LaTeX editing + compilation
    bufferline.lua    -- Tab-style buffer bar
lsp/
  clangd.lua          -- clangd server config
  prolog_ls.lua       -- SWI-Prolog LSP config
syntax/
  llvm.vim            -- LLVM IR syntax highlighting
```

## Language Support

| Language       | LSP            | Debugger     |
|----------------|----------------|--------------|
| C / C++        | clangd         | codelldb     |
| Python         | pyright        | debugpy      |
| Rust           | rust_analyzer  | codelldb     |
| Lua            | lua_ls         | -            |
| Prolog         | prolog_ls      | -            |
| LLVM IR        | -              | -            |
| LaTeX          | -              | -            |
| Assembly       | asm_lsp        | -            |

## Key Mappings

Leader key is `Space`.

### General
| Key            | Action                  |
|----------------|-------------------------|
| `<Space>w`     | Save                    |
| `<Space>q`     | Quit                    |
| `<Space>e`     | Toggle file explorer    |
| `<Esc>`        | Clear search highlight  |
| `<C-h/j/k/l>` | Navigate windows        |
| `<S-h>` / `<S-l>` | Prev / next buffer  |

### Find (Telescope)
| Key            | Action                  |
|----------------|-------------------------|
| `<C-p>`        | Find files              |
| `<Space>fg`    | Live grep               |
| `<Space>fb`    | Buffers                 |
| `<Space>fh`    | Help tags               |
| `<Space>fr`    | Recent files            |
| `<Space>/`     | Fuzzy search in buffer  |

### LSP
| Key            | Action                  |
|----------------|-------------------------|
| `gd`           | Go to definition        |
| `gr`           | Go to references        |
| `K`            | Hover docs              |
| `<Space>lr`    | Rename symbol           |
| `<Space>la`    | Code action             |
| `<Space>lf`    | Format buffer           |

### Debug
| Key            | Action                  |
|----------------|-------------------------|
| `<Space>db`    | Toggle breakpoint       |
| `<Space>dB`    | Conditional breakpoint  |
| `<Space>dc`    | Continue / start        |
| `<Space>do`    | Step over               |
| `<Space>di`    | Step into               |
| `<Space>dO`    | Step out                |
| `<Space>dt`    | Terminate               |
| `<Space>du`    | Toggle debug UI         |
| `<Space>de`    | Eval expression         |

## External Dependencies

These are not installed automatically — install them for full functionality:

```bash
# macOS (Homebrew)
brew install neovim node npm ripgrep fd

# LaTeX (optional)
brew install --cask mactex skim
brew install latexmk

# Prolog (optional)
brew install swi-prolog

# Rust (optional)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
