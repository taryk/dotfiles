;;; .emacs --- emacs initial config

;; Author: Taras Yagniuk <truestyler@gmail.com>
;; Version: 0.1
;; Keywords: emacs, perl, xs, javascript, ruby, python, php, lua, irc

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

;; exec path
(setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
(setq exec-path (append exec-path '("~/.emacs.d/w3m/bin")))

;; load
(add-to-list 'load-path "~/.emacs.d/")

;; utf-8
(setq file-name-coding-system 'utf-8)

;; Default browser
;; used by `browser-url` function
(setq browse-url-generic-program "/usr/bin/chromium-browser")

;; save session
(desktop-save-mode t)

;; show time
(setq display-time-interval 1)
(setq display-time-format "%Y.%m.%d %H:%M:%S")
(display-time-mode)

(require 'column-marker)

(require 'vline)

;; (require 'col-highlight)

(setq vline-use-timer t)
;; (vline-global-mode nil)
;; (custom-set-faces '(vline ((t (:background "#292929")))))
;; (custom-set-faces '(vline ((t (:background "#262626")))))
(custom-set-faces '(vline ((t (:background "#556b2f")))))

(require 'dirtree)

;; NumberedWindows
(require 'window-number)
(window-number-mode)
(window-number-meta-mode)

;; Line by line scrolling
;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; Set standard indent to 2 rather that 4
(setq standard-indent 2)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; search highlight
(setq search-highlight t)

;; Highlight query object 
(setq query-replace-highlight t)

;; 'y or n' replaces from 'yes or no'
(fset 'yes-or-no-p 'y-or-n-p)

;; buffer switch
(iswitchb-mode t)
(ido-mode t)

(setq tramp-default-method "ssh")

(transient-mark-mode 1)

;; Startup message
(setq inhibit-startup-message t)

;; global font lock mode
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)        ; GNU Emacs
  (setq font-lock-auto-fontify t))   ; XEmacs


;; toolbar/menubar mode disable
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; In every buffer, the line which contains the cliursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; (setq set-face-background 'hl-line "#004")
;; (setq set-face-foreground 'hl-line "black")

;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.
;; (setq ...) to set value locally to a buffer
;; (setq-default ...) to set value globally
(setq-default indent-tabs-mode nil) 

;; Wheel Mouse Scrolling
(mouse-wheel-mode t) 

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Set cursor and mouse-pointer colours
(set-cursor-color "red")
(set-mouse-color "goldenrod")

;; M-x list-color-display
(set-background-color "#333333")
(set-foreground-color "#FFFFFF")

;; Set region background colour
(set-face-background 'region "blue")

;; Fonts
;; (set-face-attribute 'default nil :height 100 :font "DejaVu Sans Mono")
;; (set-face-attribute 'default nil :height 100 :font "Droid Sans Mono")
;; (set-face-attribute 'default nil :height 100 :font "Envy Code R" :embolden t)
;; (set-face-attribute 'default nil :font "Envy Code R VS-10")
(if (string= (system-name) "darkspace")
    (set-face-attribute 'default nil :height 120 :font "Ubuntu Mono")
    (set-face-attribute 'default nil :height 100 :font "Droid Sans Mono"))

;; {{
;; cua mode
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1)               ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy nil) 
;; }}

;; {{
;; line numbers
(require 'linum+)
;; (require 'line-num)

;;(setq linum-mode 1)
(linum-mode)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)
;; }}

;; {{
;; workspaces
(require 'workspaces)
(global-set-key [?\C-q] 'workspace-goto)
(define-key global-map (kbd "C-<tab>") 'workspace-controller)
(define-key global-map [C-S-iso-lefttab] 'workspace-controller) ;; c-<tab> not working in org-mode
;; }}

;; {{
;; minimap
;; default :family "DejaVu Sans Mono" :height 30 
(setq minimap-font-face '((default nil :height 30 :font "Droid Sans Mono")))

(defun minimap-toggle ()
  "Show minimap if hidden, hide if present."
  (interactive)
  (if (and (boundp 'minimap-bufname)
           minimap-bufname
           (get-buffer minimap-bufname)
           (get-buffer-window (get-buffer minimap-bufname)))
      (minimap-kill)
    (minimap-create)))
;; }}

;; {{
;; w3m
;; apt-get install flim
(add-to-list 'load-path "~/.emacs.d/emacs-w3m")
(require 'w3m-load)
(require 'mime-w3m)
;; }}

;; {{
;; twitter
(add-to-list 'load-path "~/.emacs.d/ublog")
(require 'ublog)
;; }}

;; {{
;; ERC ( is a powerful, modular, and extensible Emacs InternetRelayChat client )
;; docs: http://mwolson.org/static/doc/erc.html )

(defmacro asf-erc-bouncer-connect (command server port nick ssl pass)
   "Create interactive command `command', for connecting to an IRC server. The
   command uses interactive mode if passed an argument."
   (fset command
         `(lambda (arg)
           (interactive "p")
	   (if (not (= 1 arg))
	       (call-interactively 'erc)
	     (let ((erc-connect-function ',(if ssl
			       'erc-open-ssl-stream
			 		     'open-network-stream)))
 	       (erc :server ,server :port ,port :nick ,nick :password ,pass))))))

;; (asf-erc-bouncer-connect erc-freenode "irc.freenode.net" 6667 "newbie" nil "pass1")
;; ssl connecion:
;; (asf-erc-bouncer-connect erc-freenodessl "irc.freenode.net" 6697 "newbie" t nil)


;; Erc Auto Join
(defmacro erc-autojoin (&rest args)
    `(add-hook 'erc-after-connect
       '(lambda (server nick)
          (cond
           ,@(mapcar (lambda (servers+channels)
                       (let ((servers (car servers+channels))
                             (channels (cdr servers+channels)))
                         `((member erc-session-server ',servers)
                           (mapc 'erc-join-channel ',channels))))
                     args)))))

;; (erc-autojoin
;;    (("irc.freenode.net" "irc.perl.org") "#perl"))

;; auth info
(load-file "~/.emacs.d/irc_authinfo.el")

;; }}

;; {{
;; Ediff
(setq ediff-split-window-function 'split-window-horizontally)
;;                                       'split-window-vertically))
;; }}

;; {{
;; Egg (Emacs got Git) is a git interface having many advanced features.
(add-to-list 'load-path "~/.emacs.d/egg")
(require 'egg)

;; egit is an Emacs Git history interface intended to be similar to qgit or gitk. Requires git.el.
(add-to-list 'load-path "~/.emacs.d/egit")
(require 'egit)
;; }}

;; {{
;; Mercurial
(require 'mercurial)
(add-to-list 'load-path "~/.emacs.d/ahg")
(require 'ahg)
;; }}

;;
;; Set mode for filename patterns
;;
(defun set-mode-for-filename-patterns (mode filename-pattern-list)
  (mapcar
    (lambda (filename-pattern)
      (setq 
        auto-mode-alist 
        (cons (cons filename-pattern mode) auto-mode-alist)))
    filename-pattern-list))

;; {{
;; Perl
(load "cperl-mode")

;; cperl-mode instead of perl-mode
(defalias 'perl-mode 'cperl-mode)

;; a few useful functions for perl developer
(require 'functions-for-perl)

;; xs-mode
(require 'xs-mode)
(autoload 'xs-mode "xs-mode" "Major mode for XS files" t)
(add-to-list 'auto-mode-alist '("\\.xs$" . xs-mode))

;; SEPIA -  Simple Emacs-Perl Interface
(setq load-path (cons "~/.emacs.d/sepia" load-path))

;;
;; cpanm Devel::PerlySense
;;       Devel::CoverX::Covered
;;       File::Corresponding
;;       Project::Libs
;;       App::perlbrew

;; perlbrew-mini
(require 'perlbrew-mini)
(perlbrew-mini-set-perls-dir "/opt/perl5/perls/")
(perlbrew-mini-use "perl-5.14.2-threaded")

;; ffap-perl-module
(eval-after-load "ffap" '(require 'ffap-perl-module))

;; PerlTidy
(require 'perltidy)

;; Perl::Critic
(require 'perlcritic)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:foreground "green" :weight bold))))
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold)))))

;; flymake
(require 'flymake)
(set-face-attribute 'flymake-errline nil 
                    :underline "red" 
                    :background nil)
(set-face-attribute 'flymake-warnline nil
                    :underline "yellow"
                    :background nil)

(setq flymake-log-level 3)

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (perlbrew-mini-get-current-perl-path)
          (list "-MProject::Libs" "-wc" local-file))))

(defun flymake-display-warning (warning) 
  "Display a warning to the user, using lwarn"
  (lwarn 'flymake :warning warning))

(set-mode-for-filename-patterns 
  'cperl-mode
  '("\\.pl$" "\\.pm$" "\\.t$"))

;;
;; cperl hook
;;
(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 2)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace nil)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-electric-parens t)
  (setq cperl-electric-keywords t)

  (setq cperl-highlight-variables-indiscriminately t)
  ; (set-face-background 'cperl-array-face "wheat")
  ; (set-face-background 'cperl-hash-face "wheat")


  (local-set-key (kbd "C-h f") 'cperl-perldoc)
  
  ;; flymake
  (flymake-mode t)

  ;; man completion
  (eval-after-load "man" '(require 'man-completion))

  (setq man-completion-at-point-functions
         '(man-completion-transform-perl
           man-completion-transform-poco))

  ;; enable perl-completion
  (require 'perl-completion)
  (perl-completion-mode t)

  (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
    (auto-complete-mode t)
    (make-variable-buffer-local 'ac-sources)
    (setq ac-sources
      '(ac-source-perl-completion)
    )
  )
  
  (custom-set-faces
    '(cperl-array-face ((t (:foreground "green" :weight bold))))
    ;; '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold))))
    '(cperl-hash-face ((t (:foreground "orange red" :weight bold)))))

  (setq cperl-electric-keywords nil)
  ;; (init-pde)
  ;; (init-perlysence)
  (linum-mode)
)

(defun init-pde ()
  (interactive)
  ;; PDE
  (add-to-list 'load-path "~/.emacs.d/pde/")
  (load "pde-load"))

(defun init-perlysence ()
  (interactive)
  ;;
  ;; ** PerlySense **
  ;; The PerlySense prefix key (unset only if needed, like for \C-o)
  (global-unset-key "\C-o")
  (setq ps/key-prefix "\C-o")

  ;; ** Flymake **
  ;; Load flymake if t
  ;; Flymake must be installed.
  ;; It is included in Emacs 22
  ;;     (or http://flymake.sourceforge.net/, put flymake.el in your load-path)
  ;; (setq ps/load-flymake t)
  ;; Note: more flymake config below, after loading PerlySense


  ;; *** PerlySense load (don't touch) ***
  (setq ps/external-dir (shell-command-to-string "perly_sense external_dir"))
  (if (string-match "Devel.PerlySense.external" ps/external-dir)
      (progn
        (message
         "PerlySense elisp files  at (%s) according to perly_sense, loading..."
         ps/external-dir)
        (setq load-path (cons
                         (expand-file-name
                          (format "%s/%s" ps/external-dir "emacs")
                          ) load-path))
        (load "perly-sense")
        )
    (message "Could not identify PerlySense install dir.
  Is Devel::PerlySense installed properly?
  Does 'perly_sense external_dir' give you a proper directory? (%s)" ps/external-dir)
    )


  ;; ** Flymake Config **
  ;; If you only want syntax check whenever you save, not continously
  (setq flymake-no-changes-timeout 9999)
  (setq flymake-start-syntax-check-on-newline nil)

  ;; ** Code Coverage Visualization **
  ;; If you have a Devel::CoverX::Covered database handy and want to
  ;; display the sub coverage in the source, set this to t
  (setq ps/enable-test-coverage-visualization nil)

  ;; ** Color Config **
  ;; Emacs named colors: http://www.geocities.com/kensanata/colors.html
  ;; The following colors work fine with a white X11
  ;; background. They may not look that great on a console with the
  ;; default color scheme.
  ;;  (set-face-background 'flymake-errline "antique white")
  ;;  (set-face-background 'flymake-warnline "lavender")
  (set-face-attribute 'flymake-errline nil 
                      :underline "red" 
                      :background nil)
  (set-face-attribute 'flymake-warnline nil
                      :underline "yellow"
                      :background nil)
  (set-face-background 'dropdown-list-face "lightgrey")
  (set-face-background 'dropdown-list-selection-face "grey")


  ;; ** Misc Config **

  ;; Run calls to perly_sense as a prepared shell command. Experimental
  ;; optimization, please try it out.
  (setq ps/use-prepare-shell-command t))

;; }}

;; {{
;; PHP
(load "php-mode")

;; (add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

(set-mode-for-filename-patterns 
  'php-mode
  '("\\.php[34]$" "\\.phtml$" "\\.module$" "\\.inc$"))

(add-hook 'php-mode-hook
          (lambda ()
            (linum-mode 1)
            
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)

            ;; auto-complete
            (when (require 'auto-complete nil t)
               (make-variable-buffer-local 'ac-sources)
               (add-to-list 'ac-sources 'ac-source-php-completion)
;;                ;; if you like patial match,
;;                ;; use `ac-source-php-completion-patial' instead of `ac-source-php-completion'.
               (add-to-list 'ac-sources 'ac-source-php-completion-patial)
               (auto-complete-mode t))))

;; }}

;; {{
;; lua mode
(setq load-path (cons "~/.emacs.d/lua-mode" load-path))
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; }}

;; {{
;; juick el
;; (add-to-list 'load-path "~/.emacs.d/emacs-juick-el/")
;; (require 'juick)
;; }}

;; {{
;; org mode
(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
'((sequence "TODO" "PROGRESS" "WAIT" "TESTING" "REPORT" "|" "DONE")
  (sequence "BUG" "FEATURE" "|" "FIXED")
  (sequence "|" "CENCELLED")
))

(setq org-todo-keyword-faces
'(("TODO"      . (:foreground "violet"  :weight bold))
  ("FEATURE"   . (:foreground "magenta" :weight bold))
  ("PROGRESS"  . (:foreground "cyan"    :weight bold))
  ("WAIT"      . (:foreground "orange"  :weight bold)) ;;  #ffd700
  ("TESTING"   . (:foreground "gray"    :weight bold))  
  ("REPORT"    . (:foreground "gray"    :weight bold))
  ("FIXED"     . (:foreground "green"   :weight bold))
  ("DONE"      . (:foreground "green"   :weight bold))
  ("CENCELLED" . (:foreground "red"     :weight bold))
))

;; agenda-files
(if (string= (system-name) "darkspace")
    (setq org-agenda-files (list "~/Documents/org/2012.org"
                                 "~/Documents/org/toread.org"
                                 "~/Documents/org/home.org"
                                 "~/Documents/org/development.org")))

(if (string= (system-name) "taryk-workstation")
    (setq org-agenda-files (list "~/Documents/org/maytech_projects.org")))
;; }}

;; {{
;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
(global-set-key (kbd "<backtab>") 'yas/expand)
;; }}

;; {{
;; auto completion mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(define-key ac-mode-map (kbd "M-RET") 'auto-complete)
;; }}


;; {{
;; sqlite3
;;(defvar sqlite-program "/usr/bin/sqlite3")
;; }}

;; {{
;; javascript
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)

(set-mode-for-filename-patterns 
  'espresso-mode
  '("\\.js$" "\\.json$"))

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(add-hook 'espresso-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
;; }}

;; {{
;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; }} 

;; {{
;; python

;; (add-to-list 'load-path "~/.emacs.d/python-mode.el-6.0.4/") 
;; (setq py-install-directory "~/.emacs.d/python-mode.el-6.0.4/")
;; ;;(require 'python)
;; (require 'python-mode)

;; (load-library "init_python")
;; }}


;; {{
;; elisp
(add-hook 'emacs-lisp-mode-hook (lambda()
                                  (linum-mode)))
;; }}

;; {{
;; CEDET
(defun init-cedet()
  (interactive)
  ;; cedet
  (load-file "~/.emacs.d/cedet/common/cedet.el")
  (global-ede-mode 1)                      ; Enable the Project management system
  (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
  (global-srecode-minor-mode 1)            ; Enable template insertion menu
)
;; }}

;; {{
;; Emacs Code Browser
(defun init-ecb()
  (interactive)
  ;; ecb
  (add-to-list 'load-path "~/.emacs.d/ecb/")
  (load-file "~/.emacs.d/ecb/ecb.el")
  (require 'ecb))
  (custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
   '(ecb-options-version "2.40"))
;; }}

;; {{
;; ruby mode
(set-mode-for-filename-patterns 
  'ruby-mode
  '("\\.rb$" "\\.rsel$" "\\.rhtml$" "\\.erb$" "\\.prawn$" "Rakefile$" "Gemfile$"))
;; }}

;; First define a variable which will store the previous column position
(defvar previous-column nil "Save the column position")

;; Define the nuke-line function. The line is killed, then the newline
;; character is deleted. The column which the cursor was positioned at is then
;; restored. Because the kill-line function is used, the contents deleted can
;; be later restored by usibackward-delete-char-untabifyng the yank commands.
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)

  ;; Store the current column position, so it can later be restored for a more
  ;; natural feel to the deletion
  (setq previous-column (current-column))

  ;; Now move to the end of the current line
  (end-of-line)

  ;; Test the length of the line. If it is 0, there is no need for a
  ;; kill-line. All that happens in this case is that the new-line character
  ;; is deleted.
  (if (= (current-column) 0)
    (delete-char 1)

    ;; This is the 'else' clause. The current line being deleted is not zero
    ;; in length. First remove the line by moving to its start and then
    ;; killing, followed by deletion of the newline character, and then
    ;; finally restoration of the column position.
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))

;;(defun kill-line-or-region (beg end) 
;; "kill region if active only or kill line normally"
;;  (interactive "r")
;; (if (region-active-p)
;;      (call-interactively 'kill-region)
;;    (call-interactively 'kill-line)))

;;  (global-set-key (kbd "C-k") 'kill-line-or-region)

;; if selected more than two lines will kill region and kill line otherwise
(defadvice kill-line (around kill-region-if-active activate)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    ad-do-it))

;; rename current file and buffer
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;; (defun rename-file-and-buffer (new-name)
;;   "Renames both current buffer and file it's visiting to NEW-NAME."
;;   (interactive "sNew name: ")
;;   (let ((name (buffer-name))
;;     (filename (buffer-file-name)))
;;     (if (not filename)
;;     (message "Buffer '%s' is not visiting a file!" name)
;;       (if (get-buffer new-name)
;;       (message "A buffer named '%s' already exists!" new-name)
;;     (progn
;;       (rename-file name new-name 1)
;;       (rename-buffer new-name)
;;       (set-visited-file-name new-name)
;;       (set-buffer-modified-p nil))))))

;; rename current file and buffer (improved version)
;; Originally from stevey, adapted to support moving to a new directory.
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
  (message "Renamed to %s." new-name)))

;; {{
;; Keys

;; (global-set-key [?\C-,] 'previous-buffer)
;; (global-set-key [?\C-.] 'next-buffer)

;; (global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; M - <arrows>
(windmove-default-keybindings 'meta)

(global-set-key [f2] 'undo)
(global-set-key [f3] 'repeat-complex-command)
(global-set-key [f4] 'replace-string)
(global-set-key [f5] 'query-replace)

(global-set-key [f7] 'flymake-display-err-menu-for-current-line)
(global-set-key [f8] 'flymake-goto-next-error)

(global-set-key [f9] 'switch-to-buffer)
(global-set-key [f12] 'nuke-line) ;; Now bind the delete line function to the F12 key
;;(global-set-key [f6] 'anything)

;; macros
(global-set-key [C-f5] 'kmacro-call-macro) 
(global-set-key [C-f6] 'kmacro-start-macro-or-insert-counter)
(global-set-key [C-f7] 'kmacro-end-or-call-macro)

;; bookmarks
(global-set-key [C-f11] 'bookmark-set)
(global-set-key [C-f12] 'bookmark-jump)


(global-set-key [delete] 'delete-char)

(global-set-key "\C-l" 'goto-line)

;; (global-set-key [M-home] 'beginning-of-buffer)
;; (global-set-key [C-home] 'beginning-of-buffer)
;; (global-set-key [home]   'beginning-of-line)
;; (global-set-key [end] 'end-of-line)
;; (global-set-key [kp-home]   'beginning-of-line)
;; (global-set-key [kp-end] 'end-of-line)
;; (global-set-key [M-end]  'end-of-buffer)
;; (global-set-key [C-end]  'end-of-buffer)

;; (define-key function-key-map "\033[1~" [home])
;; (define-key function-key-map "\033[4~" [end])
;; (global-set-key [end] 'end-of-line) 

(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end]  'end-of-line)

(define-key global-map [kp-home] 'beginning-of-line)
(define-key global-map [kp-end]  'end-of-line)

;; (define-key global-map [C-down]  'scroll-up)
;; (define-key global-map [C-up]    'scroll-down)
;; (define-key global-map [C-left]  'beginning-of-line)
;; (define-key global-map [C-right] 'end-of-line)

;; }}

;; shift left/right
(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

;; rename current file or buffer
(defun rename-current-file-or-buffer ()
  (interactive)
  (if (not (buffer-file-name))
      (call-interactively 'rename-buffer)
    (let ((file (buffer-file-name)))
      (with-temp-buffer
        (set-buffer (dired-noselect file))
        (dired-do-rename)
        (kill-buffer nil))))
  nil)

(global-set-key [C-c C-r] 'rename-current-file-or-buffer)

;; Resizing

(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key [C-M-down] 'win-resize-minimize-vert)
(global-set-key [C-M-up] 'win-resize-enlarge-vert)
(global-set-key [C-M-left] 'win-resize-minimize-horiz)
(global-set-key [C-M-right] 'win-resize-enlarge-horiz)
(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-left] 'win-resize-enlarge-vert)
(global-set-key [C-M-right] 'win-resize-minimize-vert)


;; (global-set-key (read-kbd-macro "C-TAB") 'my-func)
;; (global-set-key [C-tab] 'my-func)
;; (global-set-key [(control tab)] 'my-func)
;; (global-set-key (kbd "<C-tab>") 'my-func)
;; (global-set-key (quote [C-tab]) (quote my-func))

;; swap buffers in windows C-c C-u
(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)))

(global-set-key "\C-c\C-u" 'swap-buffers-in-windows)

;;
;; Smart beginning of line
;;
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)

;; C-S-<tab> ;; C-S-<win>-<tab>
;; (global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<C-S-s-iso-lefttab>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-S>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-s-iso-lefttab>") 'tabbar-backward-tab)
;; C-x C-<left> ;; C-x C-<right>
(global-set-key (kbd "C-x C-<right>") 'tabbar-forward-group)
(global-set-key (kbd "C-x C-<left>") 'tabbar-backward-group)

;; (put 'downcase-region 'disabled nil)

(defun kill-all-dired-buffers()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let((count 0))
          (dolist(buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count ))))

;; Finds duplicate lines and keep only the first occurrence
(defun uniquify-all-lines-region (start end)
   "Find duplicate lines in region START to END keeping first occurrence."
   (interactive "*r")
   (save-excursion
     (let ((end (copy-marker end)))
       (while
           (progn
             (goto-char start)
             (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
         (replace-match "\\1\n\\2")))))

 (defun uniquify-all-lines-buffer ()
   "Delete duplicate lines in buffer and keep first occurrence."
   (interactive "*")
   (uniquify-all-lines-region (point-min) (point-max)))

;; # Local Variables:
;; # tab-width: 2
;; # cperl-indent-level: 2
;; # End:

;;; ~/.emacs ends here
