;; Copy and Paste
;; from http://apple.stackexchange.com/questions/85222/configure-emacs-to-cut-and-copy-text-to-mac-os-x-clipboard
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))
