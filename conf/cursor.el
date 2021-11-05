;; Set Cursor in Insert mode to bar
(unless (display-graphic-p)
	(require 'evil-terminal-cursor-changer)
	(evil-terminal-cursor-changer-activate) ; or (etcc-on)
	)
(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _
