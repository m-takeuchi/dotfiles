;;;; Visual settings

;; (load-theme 'wheatgrass t)
(load-theme 'tango-dark t)
;; (load-theme 'wombat t)
(global-linum-mode t)
;; (setq linum-format "%4d\u2502 ") ; 4digits region and 1 space with vertical line
(setq linum-format "%4d ") ; 4digits region and 1 space with vertical line

;; Indent width
(setq default-tab-width 4) ; indent

;; No menu bar
(menu-bar-mode -1)

;; Show color
(require 'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "DarkOrange")

;; mouse scrolling
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))
