;; flyspell from https://github.com/d12frosted/flyspell-correct

;; here was my first attempt
;;(use-package flyspell-correct-ivy
;;  :ensure t
;;  :bind ("C-M-;" . flyspell-correct-wrapper)
;;  :init
;;  (setq flyspell-correct-interface #'flyspell-correct-ivy))

;; now cuing off https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bcheckers/spell-checking/packages.el
;; actually, above is to spacemacy


;; This is from 2016 and I don't think it is actually working
;;(setq ispell-program-name (executable-find "hunspell")
;;      ispell-dictionary "en_US")
;;
;;(use-package flyspell-correct-ivy
;;  :ensure t
;;  :demand t
;;  :bind (:map flyspell-mode-map
;;("C-c $" . flyspell-correct-word-generic)))


(use-package flyspell-correct-ivy
  :ensure t
  ;; This is CTRL-META-hypen
  :bind ("C-M-;" . flyspell-correct-wrapper)
  :init
  (setq ispell-program-name (executable-find "hunspell")
	ispell-dictionary "en_US")
  (setq flyspell-correct-interface #'flyspell-correct-ivy))
