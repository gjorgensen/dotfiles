# lifted from michaeljsmalley 

#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
files="vimrc powconfig gitconfig profile" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done

#setup symlink for the helper for vim setup
echo "Moving update_bundles from ~/.vim/ to $olddir"
mv ~/.vim/update_bundles.rb $olddir/
echo "Creating symlink to update_bundles.rb in ~/.vim/"
ln -s $dir/update_bundles.rb ~/.vim/update_bundles.rb
