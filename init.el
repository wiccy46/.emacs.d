;;; Package --- Summary
;; Minimal UI
;;(scroll-bar-mode -1)
(menu-bar-mode 1)
(tool-bar-mode   -1)
(tab-line-mode 1)
;;(tooltip-mode    -1)
;;(menu-bar-mode   -1)

(setq-default explicit-shell-file-name "/bin/zsh")

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

;; Intialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Command log
(use-package command-log-mode)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Doom Mode Line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 16)))

;; which key
(use-package which-key
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-pacakges '(which-key use-pacakge))
 '(package-selected-package
   '(evil-magit magit projectile rainbow-delimiters command-log-mode which-key use-package gruvbox-theme general evil-terminal-cursor-changer auto-package-update))
 '(package-selected-packages
   '(flycheck neotree evil-magit magit counsel with-editor which-key use-package rainbow-delimiters projectile ivy-rich gruvbox-theme general evil-terminal-cursor-changer doom-themes doom-modeline command-log-mode auto-package-update)))


;; Enbale Mouse
(xterm-mouse-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Rainbow delimiter, easy to to see ()
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Code error checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t)
  :config
    (setq flycheck-check-syntax-automatically '(save mode-enable))
    ;; the default value was '(save idle-change new-line mode-enabled)
  )

;; Stop Creating ~ file
(setq make-backup-files nil)

(load-directory "~/.emacs.d/conf")

;; Font Size
(set-face-attribute 'default nil :height 140)

(tab-line-mode 1)
