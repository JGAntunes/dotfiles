function zordinator -d "Ultimate zord creation tool"
  set -gx flags $argv
  set -l options (fish_opt --short=f --long=force)
  set -l options $options (fish_opt --short=m --long=fisherman)
  set -l options $options (fish_opt --short=s --long=symlink)
  set -l options $options (fish_opt --short=v --long=vimplug)
  argparse $options -- $argv

  set -gx functions_list $_flag_n $_flag_m $_flag_s $_flag_v $_flag_c
  set -gx keys 'fish' 'nvim' 'vim' 'ssh'  'gnupg' 'tilde' 'yamllint' 'starship.toml' 'kitty'
  set -gx linux_keys 'sway'
  set -gx osx_keys 'iterm2'

  set -gx paths ~/.config/fish ~/.config/nvim ~/.vim ~/.ssh ~/.gnupg ~ ~/.config/yamllint ~/.config/starship.toml ~/.config/kitty
  set -gx linux_paths ~/.config/sway
  set -gx osx_paths ~/.config/iterm2

  # add the platform specifc symlinks
  if test $IS_LINUX -eq 1
    set -gx keys $keys $linux_keys
    set -gx paths $paths $linux_paths
  else if test $IS_OSX -eq 1
    set -gx keys $keys $osx_keys
    set -gx paths $paths $osx_paths
  end

  set -e symlinks
  set -gx symlinks
  set -gx symlinks_error
  set -gx backups
  set -gx has_force 0

  if test -L (status -f)
    set -gx dir (string replace /fish/functions '' (dirname (realpath (status -f))))
  else
    set -gx dir (string replace /fish/functions '' (cd (dirname (status -f)); and pwd))
  end

  if test -n "$_flag_f"
    set has_force 1
  end

  function install_fisherman
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    # install fisher dependencies
    fisher update
  end

  function install_vim_plug
    set plug_url https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs $plug_url
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs $plug_url
    # install Plugins for vim and neovim
    if status --is-interactive
      vim +PlugInstall +qall
      nvim +PlugInstall +qall
    end
  end

  function copy_files
    set origin  $dir/consolas-powerline/*.ttf
    set dest ~/Library/Fonts/

    if test $has_force -ge 1
      cp -f $origin $dest
    else
      cp $origin $dest
    end
  end

  function create_symlink
    if test $has_force -ge 1
      ln -fs $argv[1] $argv[2]
    else
      ln -s $argv[1] $argv[2]
    end
    if test $status -eq 0
      set symlinks $symlinks $argv[2]
    else
      set symlinks_error $symlinksError $argv[2]
    end
  end

  function iterate
    set src_path $argv[1]
    set dist_path $argv[2]

    # create dist dir if it doesn't exist
    mkdir -p $dist_path

    set files (ls -A $src_path)
    for file in $files
      set src_file (string join '' $src_path '/' $file)
      set dist_file ( string join '' $dist_path '/' $file )
      if string match -q -- "*.vim/init.vim" $dist_file
        set dist_file ( string join '' $dist_path '/vimrc' )
      end

      if test -d $src_file
        iterate $src_file $dist_file
      else if test -e $dist_file; and not test -L $dist_file
        set backup_name (string join '' $dist_file '_backup_' (random))
        mv $dist_file $backup_name
        if test $status -eq 0
          set backups $backups (string join ' ' $dist_file ' ➡️  ' $backup_name)
          create_symlink $src_file $dist_file
        end
      else if test -L $dist_file; and test $has_force -ge 1;or not test -e $dist_file
        create_symlink $src_file $dist_file
      end
    end
  end



  function create_symlinks
    for key in $keys
      if set -l index (contains -i -- $key $keys)
        set src_dir ( string join '' $dir '/' $key )
        # the key we want to symlink is a file and not a directory
        if test -f $src_dir
          create_symlink $src_dir $paths[$index]
        else
          iterate $src_dir $paths[$index]
        end 
      end
    end

    if test (count $symlinks) -ge 1
      echo -e '\nSymlinks created successfully:'
      for sym in $symlinks
        printf '  %s\n' $sym
      end
    end

    if test (count $backups) -ge 1
      echo -e '\nBackup folders created:'
      for backup  in $backups
        printf '  %s\n' $backup
      end
      echo -e '\n\n\n'
    end

    if test (count $symlinks_error) -ge 1
      echo -e '\Failed Symlinks:'
      for sym_error  in $symlinks_error
        printf '  %s\n' $sym_error
      end
      echo -e '\n\n\n'
    end
  end

  if test -n "$_flag_s"
      or not set -q functions_list[1]
      create_symlinks
  end

  if test -n "$_flag_m"
      or not set -q functions_list[1]
      install_fisherman
  end

  if test -n "$_flag_v"
      or not set -q functions_list[1]
      install_vim_plug
  end
end
