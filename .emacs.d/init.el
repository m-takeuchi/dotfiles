;; Cask installed with Mac Homebrew
;(when (equal system-type 'darwin) (require 'cask))

;; Cask installed with curl

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.



(require 'package)
(setq package-enable-at-startup nil)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; 初期化
(package-initialize)


;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (eval-when-compile (require 'use-package))
(require 'diminish)    ;; if you use :diminish
(require 'bind-key)    ;; if you use any :bind variant
;; ;; (setq use-package-verbose t)
;; ;; (setq use-package-minimum-reported-time 0.001)



(when (equal system-type 'darwin)
 (require 'cask))
 ;; (require 'cask "~/.emacs.d/.cask/cask.el"))
(when (equal system-type 'gnu/linux)
 (require 'cask "~/.linuxbrew/share/emacs/site-lisp/cask/cask.el"))
(cask-initialize)


;; (require 'pallet)
;; (pallet-mode t)
(use-package pallet
  :ensure t
  :config
  (pallet-mode t))


;;init-loader
;; (require 'init-loader)
;; (init-loader-load "~/.emacs.d/init_loader")
(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/init_loader"))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
	("~/org/agenda/gcal.org" "/Users/m-takeuchi/org/journal.org" "/Users/m-takeuchi/org/notes.org")))
 '(package-selected-packages
   (quote
	(helm-config use-package package-utils quelpa-use-package calfw calfw-gcal org-gcal which-key gnus-alias tabbar fish-mode e2wm-term e2wm nlinum helm-notmuch ddskk visual-regexp magithub git-commit request auctex auctex-latexmk auctex-lua yatex flycheck helm helm-core markdown-mode ein helm-ag yasnippet web-mode undo-tree smex smartparens rich-minority rainbow-mode prodigy powerline popwin pallet nyan-mode multiple-cursors migemo init-loader idle-highlight-mode htmlize helm-projectile gitconfig flycheck-cask expand-region exec-path-from-shell drag-stuff auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
