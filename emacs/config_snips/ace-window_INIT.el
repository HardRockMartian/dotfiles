;; from: https://stackoverflow.com/questions/15441961/opening-a-file-from-dired-in-particular-window
(require 'ace-window)
(defun find-file-ace-window ()
  "Use ace window to select a window for opening a file from dired."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (> (length (aw-window-list)) 0)
        (aw-select "" (lambda (window)
                        (aw-switch-to-window window)
                        (find-file file)))
      (find-file-other-window file))))


(defun set-ace-window()
  (interactive)
  (setq window '(aw-select ""))
  )




;; replace dired-x "open" control
(define-key dired-mode-map "o" 'find-file-ace-window)
