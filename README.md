# My VIM configuration

The reason why this repository was created was to make it easy to store
and quickly install [VIM](http://www.vim.org/) configuration in any environment, 
without worrying about downloading plug-ins, `.vimrc` etc.
This repository consists of [`.vimrc` configuration file](.vimrc), and set of 
[plug-ins](.vim/bundle) added to this repository 
as git [submodules](.gitmodules).
Also [an installation script](install.sh)
can be found in this here, what makes installing the configuration 
stored in this repository very easy and convenient.

Although there are some attempts to make a plug-in manager for VIM,
the goal of this setup is to keep contents of this repository simple 
while providing a quick way to install and manage the configuration. 
The idea was just have configuration files and links to plug-in repositories
stored in one place, and enable to load the stored configuration 
to any environment easily.
This has been made possible using awesome plug-in 
[`pathogen.vim`](https://github.com/tpope/vim-pathogen), that allows
having plug-in files organized in custom directory structure.

## Installation instructions

Following these instructions will install VIM settings stored in this repository. 
The directory where this code exists, it is recommended to leave it in its place,
otherwise it may be necessary to run install.sh again.

First of all the package has to be retrieved from Github:
```bash
$ git clone git@github.com:LukasNormantas/vim.git
```

And go to the cloned directory:
```bash
$ cd vim
```

*Warning:* following will overwrite existing VIM configuration, 
however backup files will be created!

When we have all the required code, we may proceed with installing it:
```bash
$ ./install.sh
```

This script only has to be run once after checkout (although it is advised
to run it every time when this directory is moved to another location)

## Usage instructions 

After installing it, VIM configuration and plug-ins are linked to the contents
of this directory, so you should have chosen its location carefully.

In order to add another plug-in, just add its repository as a module:
```bash
git submodule add <git repository location> .vim/bundle/<plugin name>
```
This will update your `.gitmodule` file - make sure to commit it later to git if needed.
To fetch plug-in files it is necessary to update the module:
```bash
git submodule update
```
