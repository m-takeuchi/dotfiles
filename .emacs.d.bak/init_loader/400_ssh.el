;; (use-package tramp
;;   :config
;;   (setq tramp-default-method "ssh"))

;; helm-tramp
;; (setq tramp-default-method "ssh")
;; (defalias 'exit-tramp 'tramp-cleanup-all-buffers)
;; (define-key global-map (kbd "C-c s") 'helm-tramp)

;; Do not make a backup file like *.~
(setq make-backup-files nil)
;; Do not use auto save
(setq auto-save-default nil)
;; Do not create lock file
(setq create-lockfiles nil)

;; Connect tramp with bash
;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

