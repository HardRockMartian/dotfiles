(setenv "DICTIONARY" "en_US")
(setq ispell-local-dictionary "en_US")


(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

(use-package flyspell
  :ensure t
  :defer 1
  :custom
  (flyspell-abbrev-p t)
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (flyspell-mode 1))

(use-package flyspell-correct-ivy
  :ensure t
  :after flyspell
  :bind (:map flyspell-mode-map
        ("C-;" . flyspell-correct-word-generic))
  :custom (flyspell-correct-interface 'flyspell-correct-ivy))
