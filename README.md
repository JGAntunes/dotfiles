# Dotfiles
:love_hotel: $HOME is where your dotfiles are

## Installation
#### Clone this repo
First step, clone this repo, because I'm lazy and this is my dotfiles, they need to be placed in ~/playground/dotfiles

``` bash
$ git clone https://github.com/epilande/dotfiles.git ~/playground/dotfiles
```

### Run the init script

``` bash
$ cd ~/playgroud/dotfiles
$ bash init.sh
```

It will ask for your user and email to set your git global config. This will install everything in the `Brewfile` which will take shit loads of time :no_good:, it will also install `nvm` and `powerline fonts`.

After all this it will set :fish: as your default shell, and it will start the `yolo.fish` script

### NOTE
Some operations require sudo permissions, your password will be asked a couple of times and sent to a random server so I can take over all your data. :ok_hand:

### yolo.fish

This is where all the magic happens :sparkles: a really complex algorithm will create the symlinks. If there's a file already but it's not a symlink, it will create a backup and then the symlink.

It will output all the symlinks created and any backups as well.

After that it will install:
* :man::fishing_pole_and_fish::tropical_fish: and it's plugins
* Vim Plug for vim and neovim
* node global packages `eslint stylelint tern`


It will also install vim and neovim plugins, by openeing both editors running  `n?vim +PlugInstall +qall`


### Post install
All the paths should direct you to the dotfiles! There's a post_exec function inside the config.fish, that listens for any `brew install` and `brew cask install` whenever that happens, a Brewfile is dumped. From time to time make sure you commit that :shit:
