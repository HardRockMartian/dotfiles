;; from https://github.com/cmacrae/.emacs.d

(use-package perspective
  :ensure t
  :init
  (persp-mode)
;; AE: I don't use neotree
;;  :config
;;  (defun my/persp-neo ()
;;    "Make NeoTree follow the perspective"
;;    (interactive)
;;    (let ((cw (selected-window))
;;          (path (buffer-file-name))) ;; save current window and buffer
;;          (progn
;;            (when (and (fboundp 'projectile-project-p)
;;                       (projectile-project-p)
;;                       (fboundp 'projectile-project-root))
;;              (neotree-dir (projectile-project-root)))
;;            (neotree-find path))
;;          (select-window cw)))

;;  :hook
;;  (persp-switch . my/persp-neo)
)

  
(use-package persp-projectile
  :ensure t
  :after (perspective)
  :bind
  ("C-c x" . hydra-persp/body)
  :config
  (defhydra hydra-persp (:columns 4
                         :color blue)
    "Perspective"
    ("a" persp-add-buffer "Add Buffer")
    ("i" persp-import "Import")
    ("c" persp-kill "Close")
    ("n" persp-next "Next")
    ("p" persp-prev "Prev")
    ("k" persp-remove-buffer "Kill Buffer")
    ("r" persp-rename "Rename")
    ("A" persp-set-buffer "Set Buffer")
    ("s" persp-switch "Switch")
    ("C-x" persp-switch-last "Switch Last")
    ("b" persp-switch-to-buffer "Switch to Buffer")
    ("P" projectile-persp-switch-project "Switch Project")
    ("q" nil "Quit")))
