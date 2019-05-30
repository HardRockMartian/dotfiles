
;; Use IVY COUNSEL for tab completion (I hope)
;; from https://emacs.stackexchange.com/questions/27849/how-can-i-setup-eshell-to-use-ivy-for-tab-completion

;; This produced complaints in emacs
;;(define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)

;; reading https://www.emacswiki.org/emacs/EshellCompletion


(use-package esh-autosuggest
  :ensure t
  :hook (eshell-mode . esh-autosuggest-mode)
  ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
  ;; line below instead:
  ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
  )

;; look into https://github.com/leoliu/pcmpl-git-el
