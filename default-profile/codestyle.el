;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; wombat color theme
(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)

;; solarized
(add-to-list 'load-path (concat vendor-dir "/color-theme-solarized"))
(require 'color-theme-solarized)
(color-theme-solarized-light)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 120)

;; show line numbers
(linum-mode)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
