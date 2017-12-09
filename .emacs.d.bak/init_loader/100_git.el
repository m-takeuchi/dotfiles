;; major mode for git-config files
(use-package gitconfig
    :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  :init
  :config
  )
