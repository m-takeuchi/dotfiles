(use-package osx-dictionary
  :ensure t
  :bind (
		 ("C-c C-d" . osx-dictionary-search-pointer)
  ))

(use-package savekill
  :ensure t)

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  ;; :bind (:map yas-minor-mode-map
  ;;             ("C-x i i" . yas-insert-snippet)
  ;;             ("C-x i n" . yas-new-snippet)
  ;;             ("C-x i v" . yas-visit-snippet-file)
  ;;             ("C-x i l" . yas-describe-tables)
  ;;             ("C-x i g" . yas-reload-all))
  :config
  (yas-global-mode 1)
  )

;; Load which-key.el
(use-package which-key
  :ensure t
  :defer
  :bind (
  		 :map which-key-mode-map
			  ("C-x M-h" . which-key-C-h-dispatch)
			  ("C-c M-h" . which-key-C-h-dispatch)
			  )
  :config
  (which-key-mode 1)
  ;; (setq which-key-use-C-h-commands t) ;うまくいかない --> ?を押すと良いみたい
  )
