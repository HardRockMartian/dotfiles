;; use dired-x
(require 'dired-x)

;; in dired, hide details by default. Toggle with (
;; https://emacs.stackexchange.com/questions/27912/dired-sort-and-hide-by-default

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)
        (dired-sort-toggle-or-edit)))

