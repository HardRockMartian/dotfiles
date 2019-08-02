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

;; I have this here although I don't use it
(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

;; now use the function above
;; I actually don't like the ibuffer sidebar list. Don't see myself using it.
;;(global-set-key (kbd "C-x D") 'sidebar-toggle)
(global-set-key (kbd "C-x D") 'dired-sidebar-toggle-sidebar)

;; END DIRED SIDEBAR ------------------------------------------------------------------------------
