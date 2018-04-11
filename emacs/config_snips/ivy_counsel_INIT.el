;; ivy
(ivy-mode 1)

;; recommended
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
;; recommended shortcuts
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; recommended utilities
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;; counsel-dash from https://github.com/nathankot/counsel-dash
(require 'counsel-dash)
(setq counsel-dash-common-docsets '("AWS_Javascript" "HTML" "PYTHON 3"))

;; remember to finalize install with M-x counsel-dash-install-docset


;; hooks into emacs modes (just emacs lisp for now)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))

;; recommended options
(setq counsel-dash-docsets-path "~/.docset")
(setq counsel-dash-docsets-url "https://raw.github.com/Kapeli/feeds/master")
(setq counsel-dash-min-length 3)
(setq counsel-dash-candidate-format "%d %n (%t)")
(setq counsel-dash-enable-debugging nil)
(setq counsel-dash-browser-func 'browse-url)
(setq counsel-dash-ignored-docsets nil)
