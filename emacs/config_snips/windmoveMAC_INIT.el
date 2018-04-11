;; from http://zurktech.blogspot.com/2014/01/emacs-windmove-and-mavericks-terminalapp.html
;; NOTE terminal keymaps needed to be adjusted

;; I added the S-down one below
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])
(windmove-default-keybindings)
