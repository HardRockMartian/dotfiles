(use-package flyspell-correct
  :ensure t)

      (progn
	;; spell-checking on windows
	(setq ispell-program-name
	      (expand-file-name
	       "emacs-win/bin/hunspell"))

	(setq ispell-dictionary "english")

	(setq ispell-local-dictionary-alist
	      `(("english"
		 "[[:alpha:]]"
		 "[^[:alpha:]]"
		 "[']"
		 t
		 ("-d" "en_US" "-p" ,(expand-file-name
				      "emacs-win/share/hunspell/en_US"))
		 nil
		 utf-8))))
    (setq ispell-program-name (executable-find "hunspell")
	  ispell-dictionary "en_US"
	  flyspell-correct-interface 'flyspell-correct-ivy))
