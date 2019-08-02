;; from http://manuel-uberti.github.io/emacs/2017/08/06/eyebrowse/

;; enable desktop-save-mode to retain workspaces
(use-package eyebrowse
  :ensure t
  :config

;; this validate-setq bit didn't work
;;  (validate-setq eyebrowse-mode-line-separator " "
;;                 eyebrowse-new-workspace t)

  (eyebrowse-mode t)
  )
