(use-package skk
  :ensure ddskk
  :bind (("C-x C-j" . skk-mode)
		 ;; ("C-;" .  skk-mode)
		; iterm2 では'C-;'をSend Hex Codeとして'0x18 0x40 0x63 0x3b'と値を入力すればターミナル上でも'C-;'が効く
		 ("C-j" . skk-kakutei-key))
		 ;; (setq skk-kakutei-key (kbd "C-j"))
  :config
  (setq mac-pass-control-to-system nil)
  ;; skkserv
  (setq skk-server-host "127.0.0.1")
  (setq skk-server-portnum 1178)
  ;; user dic
  (setq skk-jisyo-code 'utf-8)
  (setq skk-jisyo (concat (getenv "HOME") "/Dropbox/skk_jisyo/skk-jisyo.utf8"))
  ;; Enter で改行しない
  (setq skk-egg-like-newline t)
  ;;"「"を入力したら"」"も自動で挿入
  (setq skk-auto-insert-paren t)
  ;; 句読点変換ルール
  (setq skk-kuten-touten-alist
  '(
    (jp . ("." . "," ))
    (en . ("." . ","))
    ))
  ;; jp でも ".""," を使う. ←最近不評でどうしたモンかしらん.
  (setq skk-kutouten-type 'en)
  ;; 全角記号の変換
  (setq skk-rom-kana-rule-list
		'(
	     ("-" nil "ー")
		 ("@" nil "＠")
		 ("!" nil "!")
         (":" nil ":")
         (";" nil ";")
         ("?" nil "?")
         ("z " nil "　")
         ("\\" nil "\\")
		 ))
  ;; 全角英語モードで U+FF0D, U+FF5E を入力する?
  ;; (when (not (string< mule-version "6.0"))
  ;;   (aset skk-jisx0208-latin-vector ?- (string #xFF0D))
  ;;   (aset skk-jisx0208-latin-vector ?~ (string #xFF5E)))
  ;; @で挿入する日付表示を西暦&半角に
  (setq skk-date-ad t)
  (setq skk-number-style nil)
  ;; 送り仮名が厳密に正しい候補を優先
  (setq skk-henkan-strict-okuri-precedence t)
  ;; 辞書の共有
  (setq skk-share-private-jisyo t)
)
  ;; misc settings
  ;; '(send-mail-function (quote smtpmail-send-it))
  ;; '(skk-auto-insert-paren nil)
  ;; '(skk-auto-okuri-process nil)
  ;; '(skk-auto-start-henkan t)
  ;; '(skk-check-okurigana-on-touroku (quote ask))
  ;; '(skk-delete-implies-kakutei nil)
  ;; '(skk-egg-like-newline nil)
  ;; '(skk-henkan-okuri-strictly nil)
  ;; '(skk-henkan-strict-okuri-precedence nil)
  ;; '(skk-j-mode-function-key-usage nil)
  ;; '(skk-japanese-message-and-error nil)
  ;; '(skk-kakutei-early t)
  ;; '(skk-preload nil)
  ;; '(skk-share-private-jisyo t)
  ;; '(skk-show-annotation nil)
  ;; '(skk-show-candidates-always-pop-to-buffer nil)
  ;; '(skk-show-icon t)
  ;; '(skk-show-inline t)
  ;; '(skk-show-japanese-menu nil)
  ;; '(skk-show-tooltip nil)
  ;; ;; '(skk-use-color-cursor t)
  ;; '(skk-use-face t)
  ;; '(skk-use-jisx0201-input-method nil)
  ;; '(skk-use-look nil)
  ;; '(skk-use-numeric-conversion t)
  ;; '(skk-verbose nil)


  ;; サーチ中にddskkが使えるようにする?
  ;; (add-hook 'isearch-mode-hook
  ;;           (function (lambda ()
  ;;                       (and (boundp 'skk-mode) skk-mode
  ;;                            (skk-isearch-mode-setup)))))
  ;; (add-hook 'isearch-mode-end-hook
  ;;           (function (lambda ()
  ;;                       (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
  ;;                       (and (boundp 'skk-mode-invoked) skk-mode-invoked
  ;;                            (skk-set-cursor-properly)))))
  ;; migemo を使うので skk-isearch にはおとなしくしていて欲しい
  ;; (setq skk-isearch-start-mode 'latin)
  ;; (add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
  ;; (add-hook 'isearch-mode-hook 'skk-isearch-mode-cleanup)
