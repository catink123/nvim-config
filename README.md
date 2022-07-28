# Catink123's Neovim Config
This is a simple Neovim config that I use for web-development and other stuff.

To install it, clone this repo to your local machine and run the bootstrapper script.
```sh
$ ./setup-debian.sh
```
This bootstrapper script updates/installs Neovim, then installs Node.js.

After the script finishes installing neccesary tools for Neovim plugins to work properly, open Neovim and run `:PlugInstall` and `:SetupCoc` commands.

You're now ready to use the config!
## Notes
This config uses ZSH as it's integrated terminal shell, so you might need to install it or change the shell used in the `init.vim` file on 56th line
```vim
function! OpenTerminal()
  split term://zsh " <-- Change "zsh" here to your preferred shell
  resize 10
endfunction
```
