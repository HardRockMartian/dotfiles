;; from http://home.thep.lu.se/~karlf/emacs.html
;; at least this bit works on my Mac

;;Spell check---------------------------
;;Swedish spell check in all i text files (including LaTeX-files).
;;These settings will not affect programming.

(add-hook 'text-mode-hook '(lambda () (flyspell-mode nil)))
;;(add-hook 'text-mode-hook '(lambda () (ispell-change-dictionary "svenska" nil)))

;;don't print words in mini-buffer when scanning, so sloooow
(setq flyspell-issue-message-flag' nil)

;;auto configure language (does not work? Says "??" in mod-line)
;;(require 'auto-dictionary)
;;(add-hook 'flyspell-mode-hook '(lambda () (auto-dictionary-mode 1)))

;;ispell=unix native spell checker, aspell=GNU's ispell, hunspell=OpenOffice & firefox
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=normal"))

(ispell-change-dictionary "american")

;; for the IVY interface bit


;;(use-package flyspell-correct-ivy
;;  :ensure t
;;  :bind ("C-;" . flyspell-correct-wrapper)
;;  :init
;;  (setq flyspell-correct-interface #'flyspell-correct-ivy))
;;

;; this doesn't work
;;(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)

;; these don't work
;;(global-set-key (kbd "C-M-;") 'flyspell-buffer)
;;(global-set-key (kbd "C-;") 'flyspell-correct-wrapper)


;; Correcting words with flyspell via Ivy
;; from https://raw.githubusercontent.com/seagle0128/.emacs.d/master/lisp/init-ivy.el

;;(use-package flyspell-correct-ivy
;;  :ensure t
;;  :after flyspell
;;  :bind (:map flyspell-mode-map
;;              ([remap flyspell-correct-word-before-point] . flyspell-correct-previous-word-generic)))
;;

;; above isn't quite right

;; I'm seeing the problem. flyspell-correct isn't packaged in MELPA it seems


(use-package flyspell-correct
  :ensure t
  )


;; easy spell check
;; from https://www.emacswiki.org/emacs/FlySpell

;;(global-set-key (kbd "<f8>") 'ispell-word)
;;(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
;;(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
;;(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
;;(defun flyspell-check-next-highlighted-word ()
;;  "Custom function to spell check next highlighted word"
;;  (interactive)
;;  (flyspell-goto-next-error)
;;  (ispell-word)
;;  )
;;(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)


;; OK. This kinda works ... enough to be useful (for now)
;; toggling only seems to work for flyspell-mode and not flyspell-prog-mode
;; disabled the prog-mode option

;; HOWTO: hit "F8 o" to toggle on of. Hit f8 twice to fix previous word
(global-set-key (kbd "<f8> o") 'flyspell-mode)
;;(global-set-key (kbd "<f8> p") 'flyspell-prog-mode)
(global-set-key (kbd "<f8> <f8>") 'flyspell-correct-previous)
