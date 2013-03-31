Dotfiles
========

Item | Description
--- | ---
bin | Local scripts (originally from [scripts](https://github.com/taryk/scripts) repository)
.emacs.d | [emacs](http://www.gnu.org/software/emacs/) initial config (originally from [emacs.d](https://github.com/taryk/emacs.d) repository)
.perltidyrc | [PerlTidy](https://metacpan.org/module/Perl::Tidy) rc file
.xbindkeysrc | Key bindings
.Xdefaults | Here's [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) configuration
.xxkbrc | [XXkb](http://sourceforge.net/projects/xxkb/) rc file
.zshrc | The [Z shell](http://www.zsh.org/) initial config (originally from [zshrc](https://github.com/taryk/zshrc) repository)
.gitconfig | [git](http://git-scm.com/) configuration file
.config/awesome | [Awesome WM](http://awesome.naquadah.org/) configuration scripts (originally from [awesomerc](https://github.com/taryk/awesomerc) repository)

# Installation #

Just run the `install.sh`

    $ ./install.sh
    Dotfiles Installer
    ------------------
    Updating submodules..
    [ ... skipped lines ... ]
    [1/11]: install '/home/someuser/bin' [y/n] ? y
    done
    [2/11]: install '/home/someuser/.zshrc' [y/n] ? y 
    done
    [3/11]: install '/home/someuser/.zsh' [y/n] ? y
    done
    [4/11]: install '/home/someuser/.emacs' [y/n] ? y
    done
    [5/11]: install '/home/someuser/.emacs.d' [y/n] ? y
    done
    [6/11]: install '/home/someuser/.emacs-private' [y/n] ? y
    done
    [7/11]: install '/home/someuser/.xbindkeysrc' [y/n] ? y
    done
    [8/11]: install '/home/someuser/.xxkbrc' [y/n] ? y
    done
    [9/11]: install '/home/someuser/.Xdefaults' [y/n] ? y
    done
    [10/11]: install '/home/someuser/.perltidyrc' [y/n] ? y
    done
    [11/11]: install '/home/someuser/.config/awesome' [y/n] ? y
    done
    ------------------------
    Finished successfully
    $
