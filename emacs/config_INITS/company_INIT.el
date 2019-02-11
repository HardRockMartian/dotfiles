(use-package company
  :ensure t
  :diminish ""
  :commands global-company-mode
  :custom
  (company-idle-delay 0.2)
  (company-selection-wrap-around t)
  (company-minimum-prefix-length 2)
  (company-require-match nil)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  :config
  (global-company-mode)
  (use-package company-statistics
    :ensure t
    :config
    (company-statistics-mode))
  (bind-keys :map company-active-map
             ("TAB" . company-complete)))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode))

;;(use-package company-jedi             ;;; company-mode completion back-end for Python JEDI
;;  :config
;;  (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments/")))
;;  (add-hook 'python-mode-hook 'jedi:setup)
;;  (setq jedi:complete-on-dot t)
;;  (setq jedi:use-shortcuts t)
;;  (defun config/enable-company-jedi ()
;;    (add-to-list 'company-backends 'company-jedi))
;;  (add-hook 'python-mode-hook 'config/enable-company-jedi))

;; another one:

;;(use-package python
;;  :ensure t
;;  :mode ("\\.py" . python-mode)
;;  :config
;;  (use-package elpy
;;    :ensure t
;;    :commands elpy-enable
;;    :config
;;    (setq elpy-rpc-python-command "python3"
;;	  elpy-modules (dolist (elem '(elpy-module-highlight-indentation
;;				       elpy-module-yasnippet))
;;			 (remove elem elpy-modules)))
;;    (elpy-use-ipython))
;;  (elpy-enable)
;;  (require 'smartparens-python)
;;(add-hook 'python-mode-hook #'smartparens-strict-mode))
;;

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  )
