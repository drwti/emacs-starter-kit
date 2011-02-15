;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
 (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
   (setenv "PATH" path-from-shell)
   (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; dir to store all extra extensions
(setq vendor-dir (concat dotfiles-dir "/vendor"))

(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)

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

;; ruby
(setq ruby-deep-indent-paren-style nil)

