;;;; key settings
(setq mac-command-modifier 'super)
;(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;(global-set-key (kbd "M-?") 'help-command)
;; (global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;;comment out or uncomment current line
;; (global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; Delete region
;; (global-set-key (kbd "<delete>") 'delete-region)
(delete-selection-mode 1)


;;; No backup files like "*.~"
(setq make-backup-files nil)
;;; No backup files like ".#*"
(setq auto-save-default nil)


;; helm
;;
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
;;(helm-migemo-mode 1)
    ;; C-hで前の文字削除
    (define-key helm-map (kbd "C-h") 'delete-backward-char)
    (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
    (define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)

    ;; キーバインド
    (define-key global-map (kbd "C-x b")   'helm-buffers-list)
    ;;(define-key global-map (kbd "C-x b") 'helm-for-files)
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


;;;; Visual settings

;(load-theme 'wheatgrass t)
(load-theme 'wombat t)
(global-linum-mode t)
;; (setq linum-format "%4d\u2502 ") ; 4digits region and 1 space with vertical line
(setq linum-format "%4d ") ; 4digits region and 1 space with vertical line
(setq default-tab-width 4) ; indent
(menu-bar-mode 0)
