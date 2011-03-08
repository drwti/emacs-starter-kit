;; wombat color theme
(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)
(color-theme-wombat)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; show line numbers
(linum-mode)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
