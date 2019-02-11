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
 '("melpa" . "https://melpa.org/packages/"))

;; initial attempt at use-package 
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package)) 

 (use-package try
:ensure t)

(use-package molokai-theme 
  :ensure t
  :load-path "themes"
  :init
  (setq molokai-theme-kit t)
  :config
  (load-theme 'molokai t)
  )

(delete-selection-mode 1)

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
  (mapcar #'bury-buffer '("*Messages*" "*scratch*")))

(add-hook 'emacs-startup-hook #'bury-messages-and-scratch) 

;; dired-modes (doesn't seem to require use-package)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (dired-hide-details-mode)
	    (dired-sort-toggle-or-edit)))


(use-package telephone-line
  :ensure t
  :init
  (require 'telephone-line)
  :config
  (telephone-line-mode 1)
  )


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

(use-package shell-pop
  :ensure t
  :init
  (require 'shell-pop)
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  ;;(setq shell-pop-term-shell "/bin/zsh")
  ;;(setq shell-pop-term-shell "/usr/local/bin/fish")
  
  ;; added a few non-working configs 190124
  
  (setq shell-pop-full-span t)
  (setq shell-pop-window-position "bottom")

  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type)
  )


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

;; multiple cursors
(use-package multiple-cursors
  :ensure t
  :init
  (require 'multiple-cursors)
  :config
  (global-set-key (kbd "C-x r c") 'mc/mark-next-like-this)
  )


;; this is useful to restore minimized
(global-set-key (kbd "C-x !") 'toggle-maximize-buffer)

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

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

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

;; BEGIN DIRED SIDEBAR (more complex that I thought) ----------------------------------------------

;; dired-hacks are required for subtree feature
(use-package dired-hacks-utils :ensure t)

(use-package dired-sidebar
  ;;:bind (("C-x D" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-subtree-line-prefix " .")
  (cond
   ((eq system-type 'darwin)
    (if (display-graphic-p)
        (setq dired-sidebar-theme 'icons)
      (setq dired-sidebar-theme 'nerd))
    (setq dired-sidebar-face '(:family "Helvetica" :height 140)))
   ((eq system-type 'windows-nt)
    (setq dired-sidebar-theme 'nerd)
    (setq dired-sidebar-face '(:family "Lucida Sans Unicode" :height 110)))
   (:default
    (setq dired-sidebar-theme 'nerd)
    (setq dired-sidebar-face '(:family "Arial" :height 140))))

  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t)

  (use-package all-the-icons-dired
    ;; M-x all-the-icons-install-fonts
    :ensure t
    :commands (all-the-icons-dired-mode)))

;; AE: I want my C-o back
;;(define-key dired-sidebar-mode-map "\C-o" nil)
;; above didn't work and neither did removing it from the
;; dired-sidebar.el code itself

;; AE: trying to just trump C-o
;; NOTE: C-o is normally "open new line"

;; :bind (("C-o" . dired-display-file))

;; no complains, but doesn't work
;; (global-set-key (kbd "C-o") 'dired-display-file)

;; A little confused by this ibuffer sidebar install
;; I M-x installed ibuffer-sidebar. Not sure if this load-path is needed?
;; I don'thave a "fork" directory, for instance

(use-package ibuffer-sidebar
  ;;:load-path "~/.emacs.d/fork/ibuffer-sidebar"
  :ensure t
  ;;:bind (("C-x D" . sidebar-toggle))
  :config
  (setq ibuffer-sidebar-use-custom-font t)
  (setq ibuffer-sidebar-face `(:family "Helvetica" :height 140)))

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

;; now use the function above
(global-set-key (kbd "C-x D") 'sidebar-toggle)

;; config INITs go here
(add-to-list 'load-path "~/.emacs.d/config_INITS/")

(load-library "company_INIT")




;; END DIRED SIDEBAR ------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy all-the-icons-dired dired-sidebar counsel swiper ivy multiple-cursors telephone-line elmacro which-key molokai-theme try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
