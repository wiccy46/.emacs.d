(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))


(use-package lsp-mode
  :straight t
  :init
  (setq lsp-imenu-index-symbol-kinds
   '(Class Method Constructor Enum Interface Function Struct))
  :config
  (define-key lsp-mode-map (kbd "C-l") lsp-command-map)
  (define-key lsp-mode-map (kbd "C-c C-o") 'lsp-find-definition))


(use-package lsp-ui
  :straight t
  :config
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-enable nil)
  (setq lsp-ui-doc-enable nil))

;; Ivy
(use-package lsp-ivy)
(use-package lsp-treemacs
  :straight t
  :after lsp
  :config
  (lsp-treemacs-sync-mode 1))

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; Typescript

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package protobuf-mode :straight t)

(use-package yaml-mode
  :straight t
  :config
  (set lsp-yaml-format-enable t)
  :hook (yaml-mode . lsp))
