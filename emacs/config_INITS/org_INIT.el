(use-package org
  :ensure org-plus-contrib
  :init
  ;; NOTE: worried about overwriting keyboard shortcuts
  ;; will consider enabling once I could use this feature
  ;; (require 'org-secretary)
  :config
  ;; I like a 21 day view from today
  (setq org-agenda-span 10
	org-agenda-start-on-weekday nil)
  
  (setq org-default-notes-file "~/Nextcloud/Documents/agendas/aaa_capture.org")

  ;; trying to fix JSON readtable error
  (when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)

  ;; begin templates

  (setq org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline "~/Nextcloud/Documents/agendas/aaa_capture.org" "Tasks")
           "* TODO %?\n  %i\n  %a")

	  ("n" "Note" entry (file+datetree "~/Nextcloud/Documents/notes/aaa_note.org")
         "* %?\nEntered on %U\n  %i\n  %a")
	))

  ;; end templates
  )
