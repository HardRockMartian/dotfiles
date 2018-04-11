(use-package ranger :ensure t
  :commands (ranger)
  :bind (("C-x d" . deer))
  :config
  (setq ranger-cleanup-eagerly t)
  )
