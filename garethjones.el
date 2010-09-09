;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

(load "garethjones/defuns")
(load "garethjones/global")
(load "garethjones/bindings")
(load "garethjones/rvm")
(load "garethjones/ack")
(load "garethjones/yasnippets")
(load "garethjones/haml")
(load "garethjones/textmate")
(load "garethjones/linum")
(load "garethjones/slime")

