(add-to-list 'load-path "vendor/slime/")
(add-to-list 'load-path "vendor/slime/contrib/")

(require 'slime)
(slime-setup '(slime-fancy slime-asdf))
(unload-feature 'slime-autodoc t) 

(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
