;; Hoping this allows me to open multiple files from CLI w/o frustration
;; from: https://emacs.stackexchange.com/questions/16675/opening-multiple-files-from-the-command-lines-puts-the-buffer-order-in-the-middl

(defun bury-messages-and-scratch ()
  (mapcar #'bury-buffer '("*Messages*" "*scratch*")))

(add-hook 'emacs-startup-hook #'bury-messages-and-scratch)
