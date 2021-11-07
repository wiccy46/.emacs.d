;; dashboard
;; M-x all-the-icons-install after first installion
;; on windows fonts need to be install (clicked on) individually
(use-package all-the-icons
  :straight t)

(use-package dashboard
  :straight t
  :config (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-startup-banner 'logo)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-set-init-info t)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))
                        ;; (agenda .5))) ;; <--- this breaks backlinking in org-roam
                        ;; (registers . 5)))
