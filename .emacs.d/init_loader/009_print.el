;; (setq ps-multibyte-buffer 'non-latin-printer)
;; (require 'ps-mule)
;; (defalias 'ps-mule-header-string-charsets 'ignore)

(use-package ps-mule
  ;; :ensure t
  :config
  (setq ps-multibyte-buffer 'non-latin-printer)
  (defalias 'ps-mule-header-string-charsets 'ignore))

(use-package pdf-preview
  ;; :ensure t
  :config
  (setq pdf-preview-preview-command "open -a Preview.app"))
