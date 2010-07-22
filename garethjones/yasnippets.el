(add-to-list 'load-path (concat vendor-dir "/yasnippet-0.6.1c"))
(require 'yasnippet)

(yas/initialize)
(yas/load-directory (concat vendor-dir "/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat vendor-dir "/yasnippets-rails/rails-snippets"))
