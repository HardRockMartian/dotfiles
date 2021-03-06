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
