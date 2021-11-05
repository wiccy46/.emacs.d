;; theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enabled-bold t
	doom-themes-enabled-italic t)
  (load-theme 'doom-opera t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))
