(use-package visual-regexp
  :ensure t
  :bind (
  ("C-c r" . vr/replace)
  ("C-c q" . vr/query-replace)
  ;; if you use multiple-cursors, this is for you:
  ("C-c m" . vr/mc-mark)))
