;; use ipython in run-python
;; from: https://stackoverflow.com/questions/17817019/how-to-open-ipython-interpreter-in-emacs
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython")
)
