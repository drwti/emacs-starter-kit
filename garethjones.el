;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "inconsolata"
                    :height 160)

;; dont send command to mac-os
(setq  mac-pass-command-to-system nil)

;; rvm
(add-to-list 'load-path (concat vendor-dir "/rvm.el"))
(require 'rvm)
(rvm-use-default)

;; snippets
(add-to-list 'load-path (concat vendor-dir "/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat vendor-dir "/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat vendor-dir "/yasnippets-rails/rails-snippets"))


