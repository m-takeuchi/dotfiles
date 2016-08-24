;; Cask installed with Mac Homebrew
;(when (equal system-type 'darwin) (require 'cask))

;; Cask installed with curl
(require 'cask "~/.cask/cask.el")

(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
 (init-loader-load (concat user-emacs-directory "init_loader"))
