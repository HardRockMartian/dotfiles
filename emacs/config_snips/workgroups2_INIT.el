;; read this as a tutorial:
;; https://github.com/pashinin/workgroups2/wiki/Tutorial

;; C-c z c
;; answer with workgroup name
;; move stuff. open files
;; C-c z C-s
;; the above will save the workgroup

;; C-c z C-f
;; the above will load a workgroup

;; C-c z k
;; above kills a workgroup. don't know what will "yank" it
;; C-c z v  will switch to a workgroup

;; seems it also restores how things were, but this is yet to be explored

;;(require 'workgroups2)

;; Change some settings
;;(workgroups-mode 1)        ; put this one at the bottom of .emacs


;; trying out perspective-el
(require 'perspective)
(persp-mode)
