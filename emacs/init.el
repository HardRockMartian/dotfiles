;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; leftover from emacs bootstrap in case I want a local load-path
;; (add-to-list 'load-path (concat user-emacs-directory "elisp"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; tangotango-theme in MELPA
;; link: https://emacsthemes.com/themes/tangotango-theme.html
;; Aquamacs stops here, so this comment is temporary
(load-theme 'tangotango t)  

;; trying for a nicer vertical border
;; Reverse colors for the border to have nicer line
;; from: https://stackoverflow.com/questions/18210631/how-to-change-the-character-composing-the-emacs-vertical-border
(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))

;; Set symbol for the border
;; this works, but only in text mode.
;; may be able to fix by using a different "glyph"
;;(set-display-table-slot standard-display-table
;;                        'vertical-border 
;;                        (make-glyph-code ?┃))
;;

;; Save desktop environment between sessions
(desktop-save-mode 1)

;; overwrite selected area with "yank"
;; if I go to the trouble of highlighting, this is how I'd like things to work.
(delete-selection-mode 1)

;; disable internationalization (get meta back on MacOS)
(set-keyboard-coding-system nil)

;; these are from https://stackoverflow.com/questions/500602/os-x-terminal-meta-key-alt-functionality-at-the-same-time
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; Which key (move to new config later)
(which-key-mode 1)

;; always refresh changes on disk
;; from: https://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)

;; elmacro with M-x elmacro-show-last-macro
(elmacro-mode)

;; AE put temp and backup files in the system TEMP directory
;; This should even be c:\TEMP on windows

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; AE column number mode by default
(setq column-number-mode t)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Stuff after here has become clips
(add-to-list 'load-path "~/.emacs.d/config_snips/")

(load-library "bury-scratch_INIT")
(load-library "dired-modes_INIT")
(load-library "dired-modes_INIT")
(load-library "powerline_INIT")
;;(load-library "treemacs_INIT")
;; (load-library "desktops_INIT")
;;(load-library "workgroups2_INIT")
;; (load-library "ranger_INIT")
(load-library "ace-window_INIT")
;; (load-library "purpose_INIT") 
(load-library "sticky-windows_INIT")
(load-library "goto_previous_frame_INIT")
(load-library "kill-other-buffers_INIT")
(load-library "match_parens_INIT")
(load-library "multiple_cursors_INIT")
(load-library "pageUp_Down_INIT")
(load-library "pbcut_paste_INIT")
(load-library "toggle-maximize-buffer_INIT")
(load-library "unfill_paragraph_INIT")
(load-library "use_ipython_INIT")
(load-library "jedi_mode_INIT")
(load-library "ivy_counsel_INIT")


;; TEST AREA

;; Goto next file using dired
;; note that I'm now trying ace-window from
;; https://stackoverflow.com/questions/15441961/opening-a-file-from-dired-in-particular-window
(defun dired_goto_next ()
  (interactive)
  (setq last-command-event 10)
  (dired-jump nil nil)
  (setq last-command-event 110)
  (dired-next-line 1)
  (dired-find-file-other-window))
;; macro for above
(global-set-key (kbd "C-x C-h") 'dired_goto_next)


;; exwm
;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-default)


;; make ediff side by side
;; from http://www.emacswiki.org/emacs/EdiffMode

;; 180404 this doesn't seem to be working
(setq ediff-split-window-function (if (> (frame-width) 150)
                                  'split-window-horizontally 
                                  'split-window-vertically))

;; END of my edits

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exwm elmacro which-key workgroups2 sr-speedbar gited magit multiple-cursors yaml-mode jedi counsel-dash dash tangotango-theme counsel window-purpose ivy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
