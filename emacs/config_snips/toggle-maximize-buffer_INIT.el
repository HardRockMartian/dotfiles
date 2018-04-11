;; This just assigns the built-in minimize-window command
;; NOTE that ) is shift + 0 ... so 0 to kill and hold shift to minimize instead
(global-set-key (kbd "C-x )") 'minimize-window)
;; RESULT: this works, but what I really need is a "toggle" which isn't built-in


;; toggle one buffer as maximized, and then toggle back to position (I hope)
;; FROM: https://gist.github.com/mads-hartmann/3402786

(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

;; Bind it to a key.
;; (global-set-key [(super shift return)] 'toggle-maximize-buffer) 
;; trying CTRL-x 4
(global-set-key (kbd "C-x !") 'toggle-maximize-buffer)
;; TBD: would like C-x $ (which is shift 4) to toggle current, move to next and then toggle that one ... or something like that
