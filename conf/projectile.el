;; Projectile

(eval-when-compile (require 'use-package))

(use-package projectile
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  ;;:bind-keymap
  ;;("C-x p" . projectile-command-map)
  :init
  (setq projectile-indexing-method 'native)
  (setq projectile-project-search-path '("~/Workspace/" "~/Holoplot/"))
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  (setq projectile-switch-project-action #'projectile-dired))
