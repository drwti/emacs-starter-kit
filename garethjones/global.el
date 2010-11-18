;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)

;; make option the super key on mac
(setq mac-option-modifier 'super)
