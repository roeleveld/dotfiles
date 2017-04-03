#### CR's dotfiles
---
# Reinstalling OSX from scratch
A dotfile setup with some procedure notes for a fresh install.
There's probably a way to automate everything... but between adding licenses, hand-transposing keyboard shortcuts and all the other little things, following this task list is probably just as good.
---
#### Steps, roughly
1. Back up old system using carbon copy cloner
2. build boot disk
3. reinstall from boot disk onto freshly wiped drive
4. initialize install
  + need some details on best osx install settings
5. install apps store stuff and turn off some icloud settings
6. clone dotfile repo & run install
  - note anything that failed
7. allow dropbox to sync
8. license stuff
9. symlink stuff
10. Install font-explorer 5
    - add dropbox font library
    - deactivate all fonts
    - activate as needed
    + figure out a better way to do this
10. manually update settings and prefs as needed (Most of this via Mackup)

#### Initialize and sync stuff
+ Install app store apps
+ Sync Sublime
+ Sync 1p
+ Sync fonts (copy paste prefs & symlink font application support (not sure if that part works)
+ symlink .zshrc
+ Sync alfred to DB
+ Add login apps & restart
+ Install creative cloud apps
+ Selectively replace preferences from Mackup Backups
+ Manually enter keyboard shortcuts
+ License stuff

---
## Dries's notes from the source repo:
https://driesvints.com/blog/getting-started-with-dotfiles

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install.sh` to start the installation
8. Make sure Dropbox is set up and synced
9. Restore preferences by running `mackup restore`
10. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the `.zshrc` file.

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

Check out the [`aliases.zsh`](./aliases.zsh) file and add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory. More info about how to customize oh-my-zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).

One thing you'll need to do manually is add your `~/.zshrc` file. You can't symlink the `.zshrc` file from your dotfiles because Mackup will already symlink your `.zshrc` from your home directory. That's why we'll need to create the file manually. Add the contents below to a `.zshrc` file in your user directory. What it will do is load the `.zshrc` file from your dotfiles. Make sure that the path to your dotfiles is correct.

```zsh
# Load Zsh
source ~/.dotfiles/.zshrc
```

> I've thought about backing up the `.zshrc` file entirely to Mackup and removing it from this repo. But I like it to be versioned with the repo so I can use it for documentation and as an example. I also believe that it makes more sense to keep it in this repo because it's pretty tied into this repo's files and settings.

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install and backup your settings with the command below. Your settings will be synced to your Dropbox so you can use them to sync between computers and reinstall them when reinstalling your Mac. If you want to save your settings to a different folder or different medium than Dropbox, [checkout the documentation](https://github.com/lra/mackup#supported-storages).

```zsh
brew install mackup
mackup backup
```

You can tweak the shell theme, the Oh My Zsh settings and much more. Go through the files in this repo and tweak everything to your liking.


