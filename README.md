Dotfiles
========

| Item | Description |
| --- | --- |
| [bin][1] | Local scripts (originally from [scripts][1] repository) |
| [.emacs.d][2] | [emacs][10] initial config (originally from [emacs.d][2] repository) |
| [.perltidyrc][3] | [PerlTidy][11] rc file |
| [.xbindkeysrc][4] | Key bindings |
| [.Xdefaults][5] | Here's [urxvt][12] configuration |
| [.xxkbrc][6] | [XXkb][13] rc file |
| [.zshrc][7] | The [Z shell][14] initial config (originally from [zshrc][17] repository) |
| [.gitconfig][8] | [git][15] configuration file |
| [.config/awesome][9] | [Awesome WM][16] configuration scripts (originally from [awesomerc][9] repository) |

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

[1]: https://github.com/taryk/scripts
[2]: https://github.com/taryk/emacs.d
[3]: https://github.com/taryk/dotfiles/blob/master/.perltidyrc
[4]: https://github.com/taryk/dotfiles/blob/master/.xbindkeysrc
[5]: https://github.com/taryk/dotfiles/blob/master/.Xdefaults
[6]: https://github.com/taryk/dotfiles/blob/master/.xxkbrc
[7]: https://github.com/taryk/dotfiles/blob/master/.zshrc
[8]: https://github.com/taryk/dotfiles/blob/master/.gitconfig
[9]: https://github.com/taryk/awesomerc
[10]: http://www.gnu.org/software/emacs/
[11]: https://metacpan.org/module/Perl::Tidy
[12]: http://software.schmorp.de/pkg/rxvt-unicode.html
[13]: http://sourceforge.net/projects/xxkb/
[14]: http://www.zsh.org/
[15]: http://git-scm.com/
[16]: http://awesome.naquadah.org/
[17]: https://github.com/taryk/zshrc
