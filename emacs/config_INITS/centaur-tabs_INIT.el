;; https://github.com/ema2159/centaur-tabs
;; works in CLI (very happy)

;; remember to bind (centaur-tabs-counsel-switch-group)

;; NOTE dired C-o doesn't add as new tab.
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  ;; options are default tabs and groups. Default is a mix
  (setq centaur-tabs-cycle-scope 'tabs)
  :bind
  ;;("C-c <prior>" . centaur-tabs-backward)
  ;;("C-c <next>" . centaur-tabs-forward))
  ("ESC <up>" . centaur-tabs-forward)
  ("ESC <down>" . centaur-tabs-backward)
  )
