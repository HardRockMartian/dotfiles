(use-package soliare
  :ensure t
  :init
  ;; brighten buffers (that represent real files)
  (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  ;; ...if you use auto-revert-mode:
  (add-hook 'after-revert-hook #'turn-on-solaire-mode)
  ;; You can do similar with the minibuffer when it is activated:
  ;; (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
  ;; To enable solaire-mode unconditionally for certain modes:
  ;; (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
  ;; (add-hook 'eshell-mode-hook #'solaire-mode)
)

(use-package doom-themes
  :ensure t
  :config
  (defun amd/doom-one-theme ()
    "load doom-theme and override some colors"
    (interactive)

    ;; nice large modeline
    (let ((font-size-factor (if (eq system-type 'darwin) 1.75 2)))
      (setq powerline-default-separator nil
            powerline-height (* amd/font-size font-size-factor)))

    (let ((doom-theme-name
            'doom-one
            ;; 'doom-molokai
            ;; (if (display-graphic-p) 'doom-one 'doom-molokai )
          ))
      (load-theme doom-theme-name t)
      (load-theme 'airline-doom-one t)

      (custom-theme-set-faces
       'airline-doom-one
       `(minibuffer-prompt ((t (:foreground nil :background nil :inherit 'wgrep-reject-face))))
       )

      (custom-theme-set-faces
       doom-theme-name
       '(flyspell-duplicate ((t (:underline "yellow" :weight bold))))
       '(flyspell-incorrect ((t (:underline "yellow" :weight bold))))
       `(rainbow-delimiters-depth-1-face ((t (:foreground "#aa88ff" :weight bold))))
       `(rainbow-delimiters-depth-2-face ((t (:foreground "#88aaff" :weight bold))))
       `(rainbow-delimiters-depth-3-face ((t (:foreground "#88ffff" :weight bold))))
       `(rainbow-delimiters-depth-4-face ((t (:foreground "#66ffaa" :weight bold))))
       `(rainbow-delimiters-depth-5-face ((t (:foreground "#ffff66" :weight bold))))
       `(rainbow-delimiters-depth-6-face ((t (:foreground "#ffaa00" :weight bold))))
       `(rainbow-delimiters-depth-7-face ((t (:foreground "#ff6666" :weight bold))))
       `(rainbow-delimiters-depth-8-face ((t (:foreground "#ff66aa" :weight bold))))

       ;; `(org-level-1 ((t (:height 1.3 :weight bold   :slant normal :foreground "#00B3EF" :background "#21272d" :underline nil :box (:line-width 4 :color "#21272d" :style nil)))))
       ;; `(org-level-2 ((t (:height 1.1 :weight bold   :slant normal :foreground "#40D3FF" :background "#21272d" :underline nil :box (:line-width 4 :color "#21272d" :style nil)))))
       `(org-level-1 ((t (:height 1.0 :weight bold   :slant normal :foreground "#aa88ff" :background "#21272d" :underline nil :box (:line-width 4 :color "#21272d" :style nil)))))
       `(org-level-2 ((t (:height 1.0 :weight bold   :slant normal :foreground "#88aaff" :background "#21272d" :underline nil :box (:line-width 4 :color "#21272d" :style nil)))))
       `(org-level-3 ((t (:height 1.0 :weight normal :slant normal :foreground "#88ffff" :underline nil)))) ;; cyan
       `(org-level-4 ((t (:height 1.0 :weight normal :slant normal :foreground "#66ffaa" :underline nil)))) ;; sea-green
       `(org-level-5 ((t (:height 1.0 :weight normal :slant normal :foreground "#ffff66" :underline nil)))) ;; yellow
       `(org-level-6 ((t (:height 1.0 :weight normal :slant normal :foreground "#ffaa00" :underline nil)))) ;; orange
       `(org-level-7 ((t (:height 1.0 :weight normal :slant normal :foreground "#ff6666" :underline nil)))) ;; red
       `(org-level-8 ((t (:height 1.0 :weight normal :slant normal :foreground "#ff66aa" :underline nil)))) ;; pink
       ;; `(org-block ((t (:foreground nil :background nil :inherit 'org-block-begin-line))))

       `(dired-subtree-depth-1-face ((t (:background "#23272e"))))
       `(dired-subtree-depth-2-face ((t (:background "#363d47"))))
       `(dired-subtree-depth-3-face ((t (:background "#4a5261"))))
       `(dired-subtree-depth-4-face ((t (:background "#5d687a"))))
       `(dired-subtree-depth-5-face ((t (:background "#717d94"))))
       `(dired-subtree-depth-6-face ((t (:background "#8493ad"))))

       `(ace-jump-face-foreground ((t (:background "color-18" :foreground "#ff8700" :weight bold))))
       `(avy-lead-face ((t (:foreground "#ffaf00"))))
       `(avy-lead-face-0 ((t (:foreground "#5fd7ff"))))
       `(avy-lead-face-1 ((t (:foreground "#66ffaa"))))
       `(avy-lead-face-2 ((t (:foreground "#ff6666"))))

       `(eyebrowse-mode-line-active ((t (:foreground "#ECBE7B" :weight bold))))
       `(flyspell-duplicate ((t (:underline "yellow" :weight bold))))
       `(flyspell-incorrect ((t (:underline "yellow" :weight bold))))
       ;; `(secondary-selection ((t (:foreground "#51afef" :background "#181e26"))))
       )

       (solaire-mode-swap-bg)
    )
  )
)
