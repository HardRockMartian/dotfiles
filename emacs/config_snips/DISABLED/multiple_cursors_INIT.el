;; AE Configure Multiple Cursors
(require 'multiple-cursors)

;; I'm wanting to just go with this one. Think C-x z repeats will be handy.
;; Turns out the command below is "clear rectangle", which I may want to use later
;; RESULT: I don't think that clear rectangle does anything I need. Prefer MC
(global-set-key (kbd "C-x r c") 'mc/mark-next-like-this)

;; This one didn't seem to work for above
;; set (global-set-key (kbd "C-x r c") 'mc/mark-next-like-this)
