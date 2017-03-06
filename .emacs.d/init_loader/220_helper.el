;; Load which-key.el
(use-package which-key
  :bind (
  		 :map which-key-mode-map
			  ("C-x M-h" . which-key-C-h-dispatch)
			  ("C-c M-h" . which-key-C-h-dispatch)
			  )
  :config
  (which-key-mode)
  ;; (setq which-key-use-C-h-commands t) ;うまくいかない --> ?を押すと良いみたい
  
  )

;; (setq which-key-popup-type 'minibuffer)
;; (setq which-key-use-C-h-commands nil) ;うまくいかない --> ?を押すと良いみたい
;; (define-key which-key-mode-map (kbd "C-x C-x") 'which-key-C-h-dispatch)
