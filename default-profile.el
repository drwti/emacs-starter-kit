;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
 (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
   (setenv "PATH" path-from-shell)
   (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; adding technomancy's package archive
(add-to-list 'package-archives
                 '("technomancy" . "http://repo.technomancy.us/emacs/") t)

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; wombat color theme
(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)
(color-theme-wombat)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 140)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; make option the super key on mac
(setq mac-option-modifier 'super)

;; map meta to command key for mac
(setq ns-command-modifier 'meta)

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)

;; custom functions

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                           (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))  

(global-set-key [f7] 'toggle-fullscreen)

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

;; ruby
(setq ruby-deep-indent-paren-style nil)
  
;; durendal
(add-to-list 'load-path (concat vendor-dir "/durendal"))
(require 'durendal)
