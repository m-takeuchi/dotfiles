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
(when (equal system-type 'gnu/linux)
 (require 'cask "/home/m-takeuchi/.linuxbrew/share/emacs/site-lisp/cask/cask.el"))

(cask-initialize)

(require 'pallet)
(pallet-mode t)

;;init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
 (init-loader-load (concat user-emacs-directory "init_loader"))
