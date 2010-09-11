(add-to-list 'load-path (concat vendor-dir "/slime/"))
(add-to-list 'load-path (concat vendor-dir "/slime/contrib/"))

(require 'slime)
(slime-setup)
;(unload-feature 'slime-autodoc t) 

(slime-setup '(slime-fancy))

(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
