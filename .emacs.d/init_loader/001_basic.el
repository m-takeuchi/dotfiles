;; C-x C-c で容易にEmacsを終了させないように質問する.
(setq confirm-kill-emacs 'y-or-n-p)

;;;; モディファイキー設定
(setq mac-command-modifier 'super)
;(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;(global-set-key (kbd "M-?") 'help-command)
;; (global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; alt(option) key as meta
(when (equal system-type 'darwin)
  (setq mac-option-modifier 'meta))


;;comment out or uncomment current line
;; (global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; Delete region
;; (global-set-key (kbd "<delete>") 'delete-region)
(delete-selection-mode 1)


;;; No backup files like "*.~"
(setq make-backup-files nil)
;;; No backup files like ".#*"
(setq auto-save-default nil)

;; 
;; migemo
;; 
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)

  (when (equal system-type 'darwin)
    (setq migemo-command "/usr/local/bin/cmigemo")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
  (when (equal system-type 'gnu/linux)
    (setq migemo-command "cmigemo")
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict"))
  )



;; helm
;;
(require 'helm-config)
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogrou")
(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
(when (executable-find "cmigemo")
  (helm-migemo-mode 1))
    ;; C-hで前の文字削除
    (define-key helm-map (kbd "C-h") 'delete-backward-char)
    (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
    (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)

    ;; キーバインド
    (define-key global-map (kbd "C-x b")   'helm-buffers-list)
    (define-key global-map (kbd "C-x b") 'helm-for-files)
    (define-key global-map (kbd "C-x C-f") 'helm-find-files)
    (define-key global-map (kbd "M-x")     'helm-M-x)
    (define-key global-map (kbd "M-y")     'helm-show-kill-ring)



;; undo-tree
;;
;; undo-tree を読み込む
(require 'undo-tree)

;; undo-tree を起動時に有効にする
(global-undo-tree-mode t)

;; M-/ をredo に設定する。
(global-set-key (kbd "M-/") 'undo-tree-redo)

