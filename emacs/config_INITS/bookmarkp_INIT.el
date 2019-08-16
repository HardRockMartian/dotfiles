;; AE bookmark+ isn't in MELPA anymore. This is supposed to download and compile it from source
;; do make sure mkdir -p ~/.emacs.d/custom/bookmark-plus  

(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
              (emacswiki-base "https://www.emacswiki.org/emacs/download/")
              (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
          (require 'url)
          (add-to-list 'load-path bookmarkplus-dir)
          (make-directory bookmarkplus-dir t)
          (mapcar (lambda (arg)
                    (let ((local-file (concat bookmarkplus-dir arg)))
                      (unless (file-exists-p local-file)
                        (url-copy-file (concat emacswiki-base arg) local-file t))))
                    bookmark-files)
          (byte-recompile-directory bookmarkplus-dir 0)
          (require 'bookmark+))
