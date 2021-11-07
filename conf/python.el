(use-package lsp-pyright
  :straight t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))
