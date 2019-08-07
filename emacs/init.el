;; useful notes
;; M-^ at end of line merges with previous line. Keep hitting for multiple

;;; package --- Main init file
;;; Commentary: 
;;; This is my init file

;;; Code: 


;; Added by Package.el.This must come before configurations of
;; installed packages.Don't delete this line.If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments. 
(package-initialize)

;; leftover from emacs bootstrap in case I want a local load-path 
;; (add-to-list 'load-path (concat user-emacs-directory "elisp")) 
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     )
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; initial attempt at use-package 
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package)) 

 (use-package try
:ensure t)

(add-hook 'eshell-mode-hook (lambda () (define-key eshell-mode-map (kbd "<tab>") (lambda () (interactive) (pcomplete-std-complete))))) 


;; THEMES ----------------------------------------------------

;; read this about themes specific to buffers
;; https://github.com/vic/color-theme-buffer-local
;; then read this about making ansi-term a different theme
;; https://emacs.stackexchange.com/questions/34183/how-to-change-default-color-theme-for-ansi-term

;;(use-package molokai-theme 
;;  :ensure t
;;  :load-path "themes"
;;  :init
;;  (setq molokai-theme-kit t)
;;  :config
;;  (load-theme 'molokai t)
;;  )


;; reading this about theme safety warnings
;; https://emacs.stackexchange.com/questions/10246/emacs-always-ask-to-trust-colour-theme-at-startup
;; RESULT: the setq custom-safe-themes bit worked

;;(use-package color-theme-sanityinc-tomorrow
;;  :ensure t
;;  :init
;;  (setq custom-safe-themes t)
;;  (load-theme 'sanityinc-tomorrow-night)
;;  )

;; misterioso is built in and not bad
;;(load-theme 'misterioso)

;; wombat has a color scheme I'm happier with. Wish the status had color, but what can you do.
(load-theme 'wombat)

;; my doom-theme thing was complicated. trying out simpler
;; wombat wasn't a bad choice
;; this is from https://github.com/cocreature/dotfiles/blob/master/emacs/.emacs.d/emacs.org

;; 190719 was using this until emax64 and Fluc (as likely theme there)
;;(use-package doom-themes
;;  :ensure t
;;  :config
;;  (progn
;;    (setq doom-one-brighter-comments t)
;;    (load-theme 'doom-one t)
;;    )
;;  )


;; Thought this was the theme used by emax64
;; apparently, it isn't
;;(use-package flucui-themes
;;  :ensure t
;;  :config
;;  (flucui-themes-load-style 'dark)
;;  )

;; from emax64
;;(use-package zenburn-theme
;;  :ensure t
;;  :demand t
;;  :config
;;  (load-theme 'zenburn t)
;;  (set-face-attribute 'font-lock-comment-face nil :italic t)
;;  (set-face-attribute 'font-lock-doc-face nil :italic t)
;;  (zenburn-with-color-variables
;;    (set-face-attribute 'button nil :foreground zenburn-yellow-2)
;;    (set-face-attribute 'default nil
;;                        :background zenburn-bg-05
;;                        :height mp/font-size-default
;;                        :font mp/font-family)
;;    (set-face-attribute 'help-argument-name nil :foreground zenburn-orange :italic nil)
;;    (set-face-attribute 'hl-line nil :background zenburn-bg+1)
;;    (set-face-attribute 'header-line nil
;;                        :background zenburn-bg-1
;;                        :box `(:line-width 2 :color ,zenburn-bg-1)
;;                        :height mp/font-size-header-line)
;;    (set-face-attribute 'mode-line nil
;;                        :box `(:line-width 2 :color ,zenburn-bg-1)
;;                        :foreground zenburn-bg+3
;;                        :height mp/font-size-mode-line)
;;    (set-face-attribute 'mode-line-inactive nil
;;                        :box `(:line-width 2 :color ,zenburn-bg-05)
;;                        :foreground zenburn-bg+3
;;                        :height mp/font-size-mode-line)
;;    (set-face-attribute 'region nil
;;                        :background zenburn-fg-1
;;                        :distant-foreground 'unspecified)
;;    (set-face-attribute 'vertical-border nil :foreground zenburn-bg)
;;    )

  ;; NOTE: See https://github.com/bbatsov/zenburn-emacs/issues/278.
;;  (zenburn-with-color-variables
;;    (mapc
;;     (lambda (face)
;;       (when (eq (face-attribute face :background) zenburn-bg)
;;         (set-face-attribute face nil :background 'unspecified)))
;;     (face-list))))



;; from https://github.com/owainlewis/emacs-color-themes
;; multiple color options
;; this is what I used before trying doom-themes (far below)

;;(use-package sublime-themes
;;  :ensure t
;;  :init
;;  (setq custom-safe-themes t)
;;  :config
;;  ;; (load-theme 'junio) ;; junio has blue background. I'm wanting to avoid blue glare
;;  (load-theme 'hickey)
;;  )

;; Maybe look into moe-theme next ... but I think I'm relatively OK with this sublime-theme "hickey"

;; made selected window different
;; CLUES: https://emacs.stackexchange.com/questions/24630/is-there-a-way-to-change-color-of-active-windows-fringe
;; this isn't dramatic enough by itself
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(mode-line ((t (:background "dim gray" :foreground "white"))))
 '(mode-line-inactive ((t (:background nil)))))

;; adding this ... perfect!
;; actually finding that it isn't really working in my terminal at least.

;;(defun highlight-selected-window ()
;;  "Highlight selected window with a different background color."
;;  (walk-windows (lambda (w)
;;                  (unless (eq w (selected-window))
;;                    (with-current-buffer (window-buffer w)
;;                      (buffer-face-set '(:background "#111"))))))
;;  (buffer-face-set 'default))
;;(add-hook 'buffer-list-update-hook 'highlight-selected-window)

;; changing divider character
;; from https://www.reddit.com/r/emacs/comments/3u0d0u/how_do_i_make_the_vertical_window_divider_more/

;; RESULT: the special character bit doesn't work well. required me do change my init.el to "raw-text" format and then didn't work anyway.

;; this option is a definate improvement. Changed to dark gray
(set-face-background 'vertical-border "dark gray")
(set-face-foreground 'vertical-border (face-background 'vertical-border))


;; END THEMES

;; trying to keep buffers clean
;; read this https://www.emacswiki.org/emacs/MidnightMode
;;(require 'midnight)


;; desktop mode so eyebrowse supposedly saves (and other reasons)
(desktop-save-mode 1)

;; I think this is about pasting into a selection
(delete-selection-mode 1)

;; shift selection seems to be working out of the box (or is configured elsewhere)
;; want my meta-shift-arrows to jump by word

;; RESULT 'mark-word-right needs to be a real function
;;(global-set-key (kbd "M-S-<right>") 'mark-word-right)

;; confused why this doesn't work. Maybe M-@ binding trumps it?
;; reading: https://emacs.stackexchange.com/questions/27464/shift-key-is-not-working-after-meta-key-mac-osx
;;(global-set-key (kbd "M-S-<right>") 'mark-word)

;; doesn't fix things for me
;;(global-set-key [(meta shift right)] 'mark-word)

;; look into windmove later
;; https://emacs.stackexchange.com/questions/3458/how-to-switch-between-windows-quickly



;; view large files
;; from https://github.com/AnthonyDiGirolamo/dotemacs/blob/master/README.org#emacs-and-git-on-windows

;; 190806 seems this became broken on elpa. Disabling (never used anyway)
;;(use-package vlf
;;  :ensure t
;;  :config (progn
;;            (require 'vlf-setup)))

(set-keyboard-coding-system nil)

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )

(global-auto-revert-mode t)

(use-package elmacro
  :ensure t
  :config
  (elmacro-mode)
  )


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq column-number-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; EDIFF has a toggle function that is easy to use. Disabling here
;;(setq split-height-threshold nil)
;;(setq split-width-threshold 0)

;; bury scratch
(defun bury-messages-and-scratch ()
  (mapcar #'bury-buffer '("*Messages*" "*scratch*" "*Org Agenda*")))

(add-hook 'emacs-startup-hook #'bury-messages-and-scratch) 

;; dired-modes (doesn't seem to require use-package)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (dired-hide-details-mode)
	    (dired-sort-toggle-or-edit)))

;; better defaults and registers (I hope?)
;; from https://www.emacswiki.org/emacs/BetterRegisters
;;(use-package better-defaults
;;  :ensure t)
;; NOPE. Not the same. better registers is here:
;; https://www.emacswiki.org/emacs/better-registers.el

(use-package telephone-line
  :ensure t
  :init
  (require 'telephone-line)
  :config
  (telephone-line-mode 1)
  )

;; switch focus when splitting windows
;; from https://stackoverflow.com/questions/6464738/how-can-i-switch-focus-after-buffer-split-in-emacs
;; I added balance-windows
;; 190804 would like this to be limited to splitting the current window ... which I think is the default behavior
;; does call for some way to split X even ways. Need to revisit
;;(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1) (balance-windows) ) )
;;(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1) (balance-windows) ) )



;; look into replacing this with multi-term-dedicated
;; see https://github.com/syl20bnr/spacemacs/issues/1301
;; https://www.emacswiki.org/emacs/MultiTerm


;; from http://pragmaticemacs.com/
;; reading this about the fonts
;; https://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode/7442266#7442266

;; this didn't actually work
;;(set-terminal-coding-system 'utf-8-unix)

;; this did
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)






;; Not sure I was ever using new_buffer_INIT

;; Not sure what sticky-windows_INIT was doing for me either

(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; kill other buffers
(defun kill-other-buffers ()
  "Kill all buffers except this one and any special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

;; trying autopair here instead of my match-paren
;; https://github.com/joaotavora/autopair

;; autopair author implies use electric-pair-mode instead
;;(use-package autopair
;;  :ensure t
;;  :init
;;  (require 'autopair)
;;  :config
;;  (autopair-global-mode)
;;  )
;;
(electric-pair-mode 1)


;; look into these TODO "extensions"
;; https://orgmode.org/manual/TODO-extensions.html#TODO-extensions

;; and these calendar/diary extensions mentioned here
;; https://orgmode.org/manual/Timestamps.html#Timestamps

;; deft
(use-package deft
  :ensure t
  ;; :bind ("<f8>" . deft)
  :commands (deft)
  :config (setq deft-directory "~/Nextcloud/Documents/agendas"
                deft-extensions '("org" "md"))
  :init
  (setq deft-use-filename-as-title t)
  )

;; org-babel, I want Python
;; READ: https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-python.html

(setq org-agenda-files
    (file-expand-wildcards "~/Nextcloud/Documents/agendas/*.org"))


;; org babel for iPython ... so I can work %magic%
(use-package ob-ipython
  :ensure t
  :init
  (setq exec-path (append exec-path '("~/anaconda/bin")))
  (setq org-babel-python-command "~/anaconda/bin/python3")
  )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (latex . t)
   ))

  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :init
  (require 'multiple-cursors)
  :config
  (global-set-key (kbd "C-x r c") 'mc/mark-next-like-this)
  )


;; this is useful to restore minimized
(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

;; shortcut for above
;;(global-set-key (kbd "C-x !") 'toggle-maximize-buffer)

;; I actually want toggle to be the default behavior
(global-set-key (kbd "C-x 1") 'toggle-maximize-buffer)

;; END toggle-maximize

;; "unfill" doesn't come by default
(use-package unfill
  :ensure t
  :init
  (require 'unfill)
  )


;; My pageup and pagedown ALL the way!
(defun sfp-page-down()
  (interactive)
  (setq this-command 'next-line)
  (next-line
   (- (window-text-height)
      next-screen-context-lines)))

(defun sfp-page-up()
  (interactive)
  (setq this-command 'previous-line)
  (previous-line
   (- (window-text-height)
      next-screen-context-lines)))

(global-set-key [next] 'sfp-page-down)
(global-set-key [prior] 'sfp-page-up)

;; skipping pbcut_paste

;; skipping Jedi mode (requires IO with python)

;; ORG MODE
;; I guess it is there automatically these days. Just set shortcuts
;;(define-key global-map "\C-cc" 'org-capture)

;; OK. Here be Dragons. Helm or Ivy?
;; sticking with Ivy here

;; BEGIN IVY SETUP ----------------------------------------------------------------------------------
;; This is nice, but not like my own setup
;; https://raw.githubusercontent.com/kaushalmodi/.emacs.d/master/setup-files/setup-ivy.el

;; had a hard time making my own use-package for ivy
;; there is one here: https://raw.githubusercontent.com/lunaryorn/.emacs.d/master/init.el

;; above didn't quite work eitehr
;; trying https://github.com/bbatsov/emacs.d/blob/master/init.el
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume))

;; from https://github.com/abo-abo/swiper/issues/1079
(defun peng-save-ivy-views ()
(interactive)
(with-temp-file "~/.emacs.d/ivy-views"
(prin1 ivy-views (current-buffer))
(message "save ivy-views to ~/.emacs.d/ivy-views")))

(defun peng-load-ivy-views ()
(interactive)
(setq ivy-views
(with-temp-buffer
(insert-file-contents "~/.emacs.d/ivy-views")
(read (current-buffer))))
(message "load ivy-views"))


;; Discovered ivy-rich. Not sure it is doing that much for me.

;;(use-package ivy-rich
;;  :ensure t
;;  :init
;;  (require 'ivy-rich)
;;  (ivy-rich-mode 1)
;;  :config
;;  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
;;
;;  (:columns
;; ((counsel-M-x-transformer (:width 40))
;;  (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))
;;)

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel-tramp
  :ensure t)

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

;; counsel-dash will take some work

;; skipping ivy-todo as it is a work in progress

;; END IVY SETUP ----------------------------------------------------------------------------------



;; config INITs go here
(add-to-list 'load-path "~/.emacs.d/config_INITS/")

;; this didn't quite do what I wanted in that it balanced everything
;;(load-library "afe-winsplit_INIT")


;; dired-sidebar or treemacs
;;(load-library "dired-sidebar_INIT")
(load-library "treemacs_INIT")

;; doom theme (newer possible choice)
;;(load-library "doom-themes_INIT")

;; centaur-tabs
(load-library "centaur-tabs_INIT")

;; persp-mode (trying out 190804)
;; autoresume seems to conflict with treemacs launching. Perhaps need to "defer"
(load-library "persp-mode_INIT")

;; launch treemacs after persp-mode
(treemacs)



;; was never able to get this to save via desktop.el
;;(load-library "eyebrowse_INIT")

;; this was my shell-pop before switching to multi-term
;;(load-library "shell-pop_INIT")
;;(global-set-key (kbd "C-t") 'shell-pop)


(load-library "multi-term_INIT")
;; not sure why this wasn't happy inside my config_INIT as a :bind
;; this works getting into the term, but not leaving it. Will close if not in it
;; added (other-window -1) but didn't help
(global-set-key (kbd "C-t") (lambda() (interactive) (multi-term-dedicated-toggle)(multi-term-dedicated-select)))

;; aweshell from https://github.com/manateelazycat/aweshell
;; cloned git repo in my config_INITS
(require 'aweshell)

(use-package eshell-prompt-extras
  :ensure t
  :config
(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))
  )

;; I like powerline. Have this load last
(use-package eshell-git-prompt
  :ensure t
  :config
  (eshell-git-prompt-use-theme 'powerline)
  )

;; other stuff from http://www.howardism.org/Technical/Emacs/eshell-present.html
;; Couldn't get my current emacs happy with these

;;(add-to-list 'eshell-visual-commands "top")
;;(add-to-list 'eshell-visual-options '("git" "--help"))
;;(add-to-list 'eshell-visual-subcommands
;;	     '("git" "log" "diff" "show"))
(setq eshell-destroy-buffer-when-process-dies t)


;; from https://emacs.stackexchange.com/questions/12503/how-to-clear-the-eshell
;;(defun eshell/clear ()
;;  "Clear the eshell buffer."
;;  (let ((inhibit-read-only t))
;;    (erase-buffer)
;;    (eshell-send-input)))

;Clear the eshell buffer.
(defun eshell/clear ()      
   (let ((eshell-buffer-maximum-lines 0)) (eshell-truncate-buffer)))


;; has elpy in company presently 
(load-library "company_INIT")
(load-library "spell_INIT")
(load-library "togetherly_INIT")
(load-library "ein_INIT")

;; this is a starter kit that unfortunately takes things over
;;(load-library "scimax_INIT")

(load-library "org_INIT") ;; want org-secretary from here in org-plus-contrib
;;(load-library "pcomplete_INIT")
;;(load-library "bookmark_plus_INIT")  NOT IN MELPA


;; from https://emacs.stackexchange.com/questions/30690/code-auto-completion-with-ivy
;; DISABLED

;; adding this here until I get a better Python section
;; this is from https://stackoverflow.com/questions/4251159/set-python-indent-to-2-spaces-in-emacs-23
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(company-require-match nil)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(custom-safe-themes
   (quote
    ("151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(org-agenda-files
   (quote
    ("~/Nextcloud/Documents/agendas/aaa_capture.org" "~/Nextcloud/Documents/agendas/general_work.org")))
 '(package-selected-packages
   (quote
    (ggtags ivy-rich centaur-tabs powershell addressbook-bookmark solaire-mode elpy all-the-icons-dired dired-sidebar counsel swiper ivy multiple-cursors telephone-line elmacro which-key molokai-theme try use-package)))
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 2)
 '(treemacs-git-mode (quote extended)))



