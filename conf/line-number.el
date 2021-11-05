;; line number
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;; Disable on certain modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))
