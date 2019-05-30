;; BETTER REGISTERS
;; reading https://github.com/rranelli/emacs-dotfiles/blob/master/lisp/init-registers.el

;; Wow. It doesn't look like better registers are in MELPA
(use-package better-registers
  :ensure t
  :init
  (require 'better-registers)
  (better-registers-install-save-registers-hook)
  (load better-registers-save-file)
  :config
  ;; make bookmark registers visible
  ;; FROM https://www.emacswiki.org/emacs/BetterRegisters
      (defface register-marker-face '((t (:background "grey")))
      "Used to mark register positions in a buffer."
      :group 'faces)
      ;; I think local registers make more sense
      (make-variable-buffer-local 'register-alist)
      )
