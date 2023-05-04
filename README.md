# My personal Neovim setup

- This is bootstrapped using [NvChad](https://nvchad.com/)
- Most dependencies are managed using [Mason](https://github.com/williamboman/mason.nvim)
- It contains the language server setups for the languages I regularly use

## Setup steps

- Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Do [pre-requisites for NvChad](https://nvchad.com/docs/quickstart/install)
- Run the following command to copy the configuration from Github to your local machine: `git clone https://github.com/markryanbotha/neovim-setup.git ~/.config/nvim --depth 1 && nvim`
- Run the following command in Neovim `:MasonInstallAll`

## Additional Manual Steps

- In order to use the Node debugger, we will need to setup the [Node2 debugger](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#node-debug2).
  - This will allow us to use [nvim-dap](https://github.com/mfussenegger/nvim-dap) to debug TypeScript/Javascript code. This can be used alongside the [jester](https://github.com/David-Kunz/jester) plugin to run and debug Jest tests.

## Extending the setup

- Look at NvChad [guide for adding custom configs](https://nvchad.com/docs/config/walkthrough)
- Ensure that all changes are performed in the `./lua/custom` directory
- Make any main changes in the `custom/chadrc.lua` file, this will work similar to the `init.lua` file
  - Adding changes here will overwrite the default setup by NvChad. For example, I have overwriten the `opt.clipboard` setting so that vim does not copy to system clipboard by default
- Add any plugins using the [Lazy](https://github.com/folke/lazy.nvim) format to the `custom/plugins.lua` file
  - I normally add any additional configurations for plugins in the `custom/configs` directory, and import them into the plugins file (if I don't add the additional configuration in-line)
- Add any custom mappings to the `custom/mappings.lua` file

## Adding a new language

- Find the name for LSP in the [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) list and add it to the array in `custom/configs/lspconfig.lua` file
  - If you need to add additional configurations for a language, then just create your own config in the same file. Look at tailwind as an example
- Add the language server to Mason in the `custom/plugins.lua` file
- Add the language to Tree-sitter to add syntax highlighting, by adding it to the `ensure_installed` list in `cusotm/plugins` file under the `nvim-treesitter` plugin
  - The names for supported languages can be found [here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
