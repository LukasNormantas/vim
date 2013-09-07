# My VIM configuration

The reason why this repository was created was to make it easy to store
and quickly install [VIM](http://www.vim.org/) configuration in any environment, 
without worrying about downloading plugins, .vimrc, etc.
This repo consists of [.vimrc configuration file](./.vimrc), and set of 
[plugins](./.vim/bundle) added to this repository 
as git [submodules](./.gitmodule).
Also [an instalation script](./install.sh)
can be found in this here, what makes installling the configuration 
stored in this repository very easy and convenient.

Although there are some attempts to make a plugin manager for VIM,
the goal of this setup is to keep contents of this repository simple 
while providing a quick way to install and manage the configuration. 
The idea was just have config files and links to plugin repositories
stored in one place, and to be able to load the stored configuration 
to any environment easily.
This has been made possible using awesome plugin 
[pathogen.vim](https://github.com/tpope/vim-pathogen), which allows
to have plugin files organized in custom directory structure.

## Installation instructions

Following these instructions will install VIM settings stored in this repository. 
The directory where this code exists, it is recommended to leave it in its place,
otherwise it may be necessary to run install.sh again.

First of all the package has to be retrieved from github:
```bash
$ git clone git@github.com:lukoko/vim.git
```

And go to the cloned directory:
```bash
$ cd vim
```

Then ensure modules have updated code:
```bash
$ git submodule update
```

**Warning:** this will overwrite existing VIM configuration, backup files
must be saved if necessary!
Now when we have all the required code, we may proceed with instaling it:
```bash
$ ./install.sh
```
This script only has to be run once after checkout (although it is advised
to run it everytime when this directory s moved to another location)

## Usage instructions 

After installing it, VIM configuration and plugins are linked to the contents
of this directory, so you should have chosen its location carefully.

In order to add another plugin, just add its repository as a module:
```bash
git submodule add <git repository location> .vim/bundle/<plugin name>
```
This will update your .gitmodule file - make sure to commit it later to git if needed.
To fetch plugin files it is necessary to update the module:
```bash
git submodule update
```
