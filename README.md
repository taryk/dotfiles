Dotfiles
========

| Item                  | Description                                                                                 |
| --------------------- | ------------------------------------------------------------------------------------------- |
| [bin][1]              | Local scripts (originally from [scripts][1] repository)                                     |
| [.emacs.d][2]         | [Emacs][10] initial config (originally from [emacs.d][2] repository)                        |
| [.perltidyrc][3]      | [PerlTidy][11] rc file                                                                      |
| [.xbindkeysrc][4]     | Key bindings                                                                                |
| [.Xdefaults][5]       | Here's [urxvt][12] configuration                                                            |
| [.xxkbrc][6]          | [XXkb][13] rc file                                                                          |
| [.zshrc][7]           | Initial starter of The [Z Shell][14] (`~/.zsh/` is originally from [zshrc][17] repository)  |
| [.tmux.conf][18]      | [Tmux][19] config                                                                           |
| [.gitconfig][8]       | [Git][15] configuration file                                                                |
| [.config/awesome][9]  | [Awesome WM][16] configuration scripts (originally from [awesomerc][9] repository)          |

# Installation #

Just run the `install.sh`

    $ ./install.sh
    Dotfiles Installer
    ------------------
    Updating submodules..
    [ ... skipped lines ... ]

    [1/14]: install '/home/taryk/bin' [y/n] ? y
    done
    [2/14]: install '/home/taryk/.zshrc' [y/n] ? y
    done
    [3/14]: install '/home/taryk/.zsh' [y/n] ? y
    done
    [4/14]: install '/home/taryk/.emacs' [y/n] ? y
    done
    [5/14]: install '/home/taryk/.emacs.d' [y/n] ? y
    done
    [6/14]: install '/home/taryk/.emacs-private' [y/n] ? y
    done
    [7/14]: install '/home/taryk/.xbindkeysrc' [y/n] ? y
    done
    [8/14]: install '/home/taryk/.xxkbrc' [y/n] ? y
    done
    [9/14]: install '/home/taryk/.gitconfig' [y/n] ? y
    done
    [10/14]: install '/home/taryk/.urxvt' [y/n] ? y
    done
    [11/14]: install '/home/taryk/.Xdefaults' [y/n] ? y
    done
    [12/14]: install '/home/taryk/.perltidyrc' [y/n] ? y
    done
    [13/14]: install '/home/taryk/.config/awesome' [y/n] ? y
    done
    [14/14]: install '/home/taryk/.tmux.conf' [y/n] ? y
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
[18]: https://github.com/taryk/dotfiles/blob/master/.tmux.conf
[19]: http://tmux.sourceforge.net/
