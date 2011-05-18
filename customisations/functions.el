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

;; technomancy's slamhounds (reorganises ns for you)
(defun slamhound ()
  (interactive)
  (goto-char (point-min))
  (kill-sexp)
  (insert (first (slime-eval `(swank:eval-and-grab-output
                               (format "(do (require 'slam.hound)
                                          (slam.hound/reconstruct \"%s\"))"
                                       ,buffer-file-name))))))
