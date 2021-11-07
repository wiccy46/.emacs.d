(straight-use-package 'company)
(straight-use-package 'smartparens)

(smartparens-global-mode t)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.25)
(setq company-backends '(company-capf))

(setq completion-ignore-case t)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


(defun insert-file-name (filename &optional args)
    "Insert name of file FILENAME into buffer after point.
  
  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.
  
  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.
  
  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
    ;; Based on insert-file in Emacs -- ashawley 20080926
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (file-relative-name filename)))
          ((not (null args))
           (insert (expand-file-name filename)))
          (t
           (insert filename))))

;; emoji completion
(use-package company-emoji
      :straight (company-emoji
        :type git
			  :host github
			  :repo "dunn/company-emoji"
			  :branch "trunk"
			  :files ("*.el")))

(add-to-list 'company-backends 'company-emoji)
