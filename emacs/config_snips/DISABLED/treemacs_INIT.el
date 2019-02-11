;; from https://github.com/Alexander-Miller/treemacs

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-change-root-without-asking nil
          treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-file-event-delay           5000
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-never-persist              nil
          treemacs-no-png-images              nil
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ([f8]         . treemacs-toggle)
        ("M-0"        . treemacs-select-window)
        ("C-c 1"      . treemacs-delete-other-windows)
        ("M-m ft"     . treemacs-toggle)
        ("M-m fT"     . treemacs)
        ("M-m fB"     . treemacs-bookmark)
        ("M-m f C-t"  . treemacs-find-file)
        ("M-m f M-t"  . treemacs-find-tag)))

(use-package treemacs-projectile
  :defer t
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header)
  :bind (:map global-map
              ("M-m fP" . treemacs-projectile)
              ("M-m fp" . treemacs-projectile-toggle)))
