(use-package auto-complete
  :ensure t
  :config
  (use-package auto-complete-config)     ; 必須ではないですが一応
  (global-auto-complete-mode t))

(use-package jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (require 'python)
  (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (setq python-shell-completion-native nil))
