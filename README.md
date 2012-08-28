Hacked from michaeljsmalley

Put dotfiles in the dotfiles directory.  Do prefix with "."

Install vim first.  The last step is dependent on the existance of the .vim directory 

Edit the makesymlinks.sh to include all files you want copied and symlinked

On a new machine do  

cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh


Then run 
cd .vim/
ruby update_bundles.rb
