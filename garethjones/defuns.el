(defun garethjones-copy-line ()
  "Copies current line to line below"
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (newline-and-indent)
  (yank)
  (beginning-of-line)
  (indent-according-to-mode))
  
