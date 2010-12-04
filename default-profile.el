;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; adding technomancy's package archive
(add-to-list 'package-archives
                 '("technomancy" . "http://repo.technomancy.us/emacs/") t)

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; wombat color theme
;; (add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
;; (require 'color-theme-wombat)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; make option the super key on mac
(setq mac-option-modifier 'super)

;; map meta to command key for mac
(setq ns-command-modifier 'meta)

(global-set-key [f7] 'ns-toggle-fullscreen)

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)

;; custom functions

(defvar *clojure-scratch-dir* "~/sandbox/projects/clojure/clj-scratch"
  "Location of a scratch project for quickly playing with clojure stuff")

(defun scratch-clojure ()
  (interactive)
  (if (file-exists-p *clojure-scratch-dir*)
      (progn
        (cd *clojure-scratch-dir*)
        (elein-swank)
        (find-file (concat *clojure-scratch-dir* "/src/clj_scratch/core.clj")))
    (message "make sure you have your clj-scratch project set up sucker")))

;; ack
(require 'ack)

;; elein
(add-to-list 'load-path (concat vendor-dir "/elein"))
(require 'elein)

;; rvm
(add-to-list 'load-path (concat vendor-dir "/rvm.el"))
(require 'rvm)
(rvm-use-default)

;; yasnippets
(add-to-list 'load-path (concat vendor-dir "/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat vendor-dir "/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat vendor-dir "/yasnippets-rails/rails-snippets"))

;; haml
(add-to-list 'load-path (concat vendor-dir "/haml"))
(require 'haml-mode)
(require 'sass-mode)

;; textmate
(add-to-list 'load-path (concat vendor-dir "/textmate"))
(require 'textmate)
(textmate-mode)

;; undo-tree
(require 'undo-tree)

;; durendal
(add-to-list 'load-path (concat vendor-dir "/durendal"))
(require 'durendal)
