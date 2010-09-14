(defun garethjones-copy-line ()
  "Copies current line to line below"
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (newline-and-indent)
  (yank)
  (beginning-of-line)
  (indent-according-to-mode))

(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))
(global-set-key [f7] 'toggle-fullscreen)

