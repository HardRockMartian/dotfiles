;; My original

;;(use-package projectile
;;  :ensure t
;;  :config
;;  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;  (projectile-mode +1))
;;
;;(use-package counsel-projectile
;;  :ensure t
;;  :init
;;  (counsel-projectile-mode 1)
;;  )


;; new from https://github.com/pcorey/.emacs.d/blob/8d187c56d7e3d931a09398acc91fbd3181093f0a/init.el

;; Project management
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode))
(use-package counsel-projectile 
  :ensure t
  :config
  (counsel-projectile-mode))

;; Workspaces
(use-package perspective
  :ensure t
  :config
  (persp-mode))
(use-package persp-projectile
  :ensure t)
