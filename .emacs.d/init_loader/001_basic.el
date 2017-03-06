;; 日本語設定
(set-language-environment "Japanese")
;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; クリップボードを利用する
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
 
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(when (equal system-type 'darwin) 
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))
(when (equal system-type 'gnu/linux)
  (setq x-select-enable-clipboard t))


;; C-x C-c で容易にEmacsを終了させないように質問する.
(setq confirm-kill-emacs 'y-or-n-p)

;;;; モディファイキー設定
(setq mac-command-modifier 'super)
;(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;(global-set-key (kbd "M-?") 'help-command)
;; (global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)

;;;; C-hをbackspaceに
;; (keyboard-translate ?\C-h ?\C-?)
;; (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key key-translation-map [?\C-h] [?\C-?])
;; (global-set-key (kbd "C-?") 'help-for-help)
;; (global-set-key (kbd "C-h") 'delete-backward-char)
;; (global-set-key (kbd "M-h") 'backward-kill-word)


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
(use-package migemo
  :if (and (executable-find "cmigemo") (require 'migemo nil t))
  :init
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (when (equal system-type 'darwin)
    (setq migemo-command "/usr/local/bin/cmigemo")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
  (when (equal system-type 'gnu/linux)
    (setq migemo-command "cmigemo")
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict"))
  :config
  (migemo-init)
  )


;; 
;; helm
;;
(use-package helm-config
  :ensure helm
  :bind (("C-c h" .    helm-mini)
	     ("C-x b" .    helm-buffers-list)
		 ("C-x b" .    helm-for-files)
		 ("C-x r" .    helm-recentf)
         ("C-x C-f" .  helm-find-files)
		 ("M-x" .      helm-M-x)
		 ("M-y" .      helm-show-kill-ring)
 		 ("M-r" .      helm-resume)
		 ("C-M-r" .    helm-apropos)
		 :map helm-find-files-map
		 ([TAB] .      helm-execute-persistent-action)
		 :map helm-read-files-map
		 ([TAB] .      helm-execute-persistent-action)
		 )
  :config
  (helm-mode 1)
  (when (executable-find "cmigemo") (helm-migemo-mode 1)) ; cmigemoがあればhelm内でも使用
  )

(use-package helm-ag
  :ensure t
  :init (setq helm-ag-base-command "ag --nocolor --nogrou")
  :bind (("C-c s" . helm-ag)))


;; 
;; undo-tree
;;
(use-package undo-tree
  :ensure t
  :config
  ;; undo-tree を起動時に有効にする
  (global-undo-tree-mode t)
  :bind (
  ;; M-/ をredo に設定する。
  ("M-/" . undo-tree-redo)))


;;; mostly equivalent (see below about fallbacks) but shorter:
(setq auth-sources '((:source "~/dotfiles_secret/google_dev.gpg")))
;;; even shorter and the _default_:
;; (setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))

;; EasyPGを利用したmy関数
(use-package cl)
(defun* my:auth-source-get-passwd (&rest spec &allow-other-keys)
  (let ((founds (apply 'auth-source-search spec)))
    (when founds
      (funcall (plist-get (nth 0 founds) :secret)))))
