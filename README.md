# Dotfiles AKA ZORDinator
Heavily based on [@FabioAntunes](https://github.com/FabioAntunes) [ones](https://github.com/FabioAntunes/dotfiles). Thanks bud :+1:

Its focus is to hold everything that I need to be productive in any Unix based env.

So, behold, **ZORDinator**, the maker of ZORDS!

![image](https://user-images.githubusercontent.com/5799039/50553897-8829f180-0ca8-11e9-82be-67ff3f97d916.gif)

## About
I use:
* fish
* neovim
* terminator/iTerm2
* ubuntu based OSes
* OSX sometimes
* other stuff I don't actually remember

So that's basically what you're going to get here :eyes:

## Installation
#### Clone this repo
First step, clone this repo, because I'm lazy and this are my dotfiles, they need to be placed in `~/github/dotfiles`

``` bash
$ git clone https://github.com/JGAntunes/dotfiles.git ~/github/dotfiles --recurse-submodules
```

Oh btw I'm using some git submodules.

### Run the init script

``` bash
$ bash init.sh
```

After all this it will set :fish: as your default shell, and it will start the `init.fish` script

### NOTE
Some operations require sudo permissions, your password will be asked a couple of times and sent to a random server so I can take over all your data. :ok_hand:

### Global functions

After running both the `init.sh` and `init.fish` there will be a couple functions available globally.

#### zordinator
This is the main function that allows us run all the commands related to dotfiles, it has autocompletion enabled just type `zordinator -` and press tab.
If no args are passed to the `zordinator` function, all the options will be executed in this order:

1. create symlinks, any existing symlinks will be preserved. 
2. install fisherman
3. install vim plug Plugins

If we use the `-f/--force` it will run all the options above, but won't preserve any symlinks

The next args allows you to run the function in a granular way, feel free to combine multiple args

* `-f/--force` - it will overwrite existing symlinks
* `-s/--symlink` - create symlinks, this options will ignore already created symlinks. If a regular file already exists, it will be renamed aka backup file. Combine with the `-f/--force`
* `-m/--fisherman` - install fisherman and it's plugins.
* `-v/--vimplug` - install vim and nvim Plugins.

At the end it will output all the symlinks created, any errors creating symlinks and any backup files created.

### Post install
All the paths should direct you to the dotfiles! There's a `post_exec` function inside the `config.fish`, that listens for any `brew install` and `brew cask install`. Whenever that happens, a Brewfile is dumped, commited and pushed to the git repo.
The message will be `Updated Brewfile :beer:`. You can change this by setting `$DOTFILES_MSG` to whatever you want.

TODO document apt behaviour

#N?VIM

TODO

