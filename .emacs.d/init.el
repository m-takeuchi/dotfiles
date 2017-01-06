;; Cask installed with Mac Homebrew
;(when (equal system-type 'darwin) (require 'cask))

;; Cask installed with curl

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (equal system-type 'darwin)
 (require 'cask))
 ;; (require 'cask "~/.cask/cask.el"))
(when (equal system-type 'gnu/linux)
 (require 'cask "~/.linuxbrew/share/emacs/site-lisp/cask/cask.el"))

(cask-initialize)

(require 'pallet)
(pallet-mode t)

;;init-loader
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(init-loader-show-log-after-init (quote error-only))
 '(package-selected-packages
   (quote
	(flycheck git-commit helm-core magit-popup with-editor yasnippet web-mode use-package undo-tree smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors migemo magit init-loader idle-highlight-mode htmlize helm flycheck-cask expand-region exec-path-from-shell drag-stuff))))
 (init-loader-load (concat user-emacs-directory "init_loader"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
