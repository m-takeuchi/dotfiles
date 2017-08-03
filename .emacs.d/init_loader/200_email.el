(use-package cp5022x
  :ensure t)

(use-package notmuch
  :ensure t
  :preface

  ;; リンクを規定ブラウザで開く
  (when (equal system-type 'darwin)
	(setq browse-url-browser-function 'browse-url-default-macosx-browser)
    ;; (setq browse-url-browser-function 'w3m-browse-url)
	)
  (when (equal system-type 'linux)
   	 (setq browse-url-browser-function 'eww-browse-url))

  ;; 日本語に関する設定
  (setq mm-coding-system-priorities
		;; '(utf-8 iso-2022-jp iso-2022-jp-2 shift_jis iso-8859-1))
		 '(utf-8 iso-2022-jp iso-2022-jp-2 shift_jis iso-8859-1 cp50220))
  (setq mm-use-ultra-safe-encoding t)
  (setq message-sendmail-envelope-from 'header)
  (setq	mail-specify-envelope-from 'header)
  (setq mail-envelope-from 'header)
  ;; Reply自動To
  ;; (autoload 'gnus-alias-determine-identity "gnus-alias" "" t)
  ;; (add-hook 'message-setup-hook 'gnus-alias-determine-identity)

  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq sendmail-program "msmtp")
  ;; (setq message-sendmail-f-is-evil nil)
  (setq message-sendmail-f-is-evil t)
  (setq mail-interactive t)
  ;; (setq user-full-name "Mitsuaki Takeuchi")
  ;; (setq user-mail-address "m-takeuchi@kuee.kyoto-u.ac.jp")
  (setq message-kill-buffer-on-exit t)
  (setq mail-user-agent 'message-user-agent)

  ;; アカウントによる署名などの切り替え
  (autoload 'gnus-alias-determine-identity "gnus-alias" "" t)
  (add-hook 'message-setup-hook 'gnus-alias-determine-identity)
  ;; Define two identities, "home" and "work"
  (setq gnus-alias-identity-alist
		'(("m2takeuchi"
		   nil ;; Does not refer to any other identity
		   "Mitsuaki Takeuchi <m2takeuchi@gmail.com>" ;; Sender address
		   nil ;; No organization header
		   nil ;; No extra headers
		   nil ;; No extra body text
		   "~/.signature_m2takeuchi")
		  ("kumail_ja"
		   nil
		   "Mitsuaki Takeuchi <m-takeuchi@kuee.kyoto-u.ac.jp>"
		   nil ;; No organization header
		   nil ;; No extra headers
		   nil ;; No extra body text ;; (("Bcc" . "john.doe@example.com"))
		   "~/.signature_kumail_ja")))
  ;; Use "m2takeuchi" identity by default
  (setq gnus-alias-default-identity "m2takeuchi")
  ;; Define rules to match kumail_ja identity
  (setq gnus-alias-identity-rules
	;; '(("kumail_ja" ("any" "\\(m-takeuchi@kuee\\.kyoto-u\\.ac\\.jp\\|takeuchi.mitsuaki.6w@kyoto-u\\.ac\\.jp\\)" both) "kumail_ja")))
	'(("kumail_ja" ("from" "\\(m-takeuchi@kuee\\.kyoto-u\\.ac\\.jp\\|takeuchi.mitsuaki.6w@kyoto-u\\.ac\\.jp\\)" both) "kumail_ja")))
  ;; Determine identity when message-mode loads
  (add-hook 'message-setup-hook 'gnus-alias-determine-identity)

  ;; 返信の引用フォーマット
  (setq message-citation-line-function 'message-insert-formatted-citation-line)
  (setq message-citation-line-format "On %Y-%m-%d, %f wrote:\n")

  ;; 転送時に元メッセージ
  (defun my-forward (prefix)
	(interactive "P")
	(let (
		  ;; (message-forward-as-mime nil) ; rfc822添付ではなくインライン化
		  ;; (message-forward-ignored-headers ".*") ; 正規表現に一致するヘッダを無視
		  (message-make-forward-subject-function 'message-forward-subject-fwd) ;記事の表題の前に Fwd: 
		  )
	  (notmuch-show-forward-message prefix)))
  

  ;; show画面でのフラグon-off
  (defun notmuch-show-toggle-deleted ()
  	"toggle deleted tag for message"
  	(interactive)
  	(if (member "deleted" (notmuch-show-get-tags))
  		(notmuch-show-tag (list "-deleted"))
  	  (notmuch-show-tag (list "+deleted"))))
  (defun notmuch-show-toggle-flagged ()
	"toggle flagged tag for message"
	(interactive)
	(if (member "flagged" (notmuch-show-get-tags))
		(notmuch-show-tag (list "-flagged"))
	  (notmuch-show-tag (list "+flagged"))))
  (defun notmuch-show-toggle-jobhant ()
	"toggle flagged tag for message"
	(interactive)
	(if (member "jobhant" (notmuch-show-get-tags))
		(notmuch-show-tag (list "-jobhant"))
	  (notmuch-show-tag (list "+jobhant"))))
  ;; show画面でのフラグon-off
  (defun notmuch-search-toggle-deleted ()
  	"toggle deleted tag for message"
  	(interactive)
  	(if (member "deleted" (notmuch-search-get-tags))
  		(notmuch-search-tag (list "-deleted"))
  	  (notmuch-search-tag (list "+deleted"))))
  (defun notmuch-search-toggle-flagged ()
	"toggle flagged tag for message"
	(interactive)
	(if (member "flagged" (notmuch-search-get-tags))
		(notmuch-search-tag (list "-flagged"))
	  (notmuch-search-tag (list "+flagged"))))
  (defun notmuch-search-toggle-jobhant ()
	"toggle flagged tag for message"
	(interactive)
	(if (member "jobhant" (notmuch-search-get-tags))
		(notmuch-search-tag (list "-jobhant"))
	  (notmuch-search-tag (list "+jobhant"))))

  ;; C-c m opens up Notmuch from any buffer
  :bind (("C-c m" . notmuch)
   		 :map notmuch-show-mode-map
		   ("r" . notmuch-show-reply)
           ("R" . notmuch-show-reply-sender)
		   ("F" . notmuch-show-toggle-flagged)
		   ("D" . notmuch-show-toggle-deleted)
		   ("J" . notmuch-show-toggle-jobhant)
		   (".b" . browse-url-at-point)
		   ("f" . my-forward)			;forward messages inline
   		 :map notmuch-search-mode-map
           ("r" . notmuch-search-reply-to-thread)
           ("R" . notmuch-search-reply-sender)
		   ("F" . notmuch-search-toggle-flagged)
   		   ("D" . notmuch-search-toggle-deleted)
		   ("J" . notmuch-search-toggle-jobhant)
		   )

  :config
  (setq notmuch-search-oldest-first nil) ; Sort for newest first
  (setq notmuch-mua-reply-insert-header-p-function 'notmuch-show-reply-insert-header-p-never)
  ;; (setq notmuch-mua-reply-insert-header-p-function 'notmuch-show-reply-insert-header-p-trimmed)
  ;; (setq notmuch-mua-reply-insert-header-p-function 'notmuch-show-reply-insert-header-p-minimal)
  (setq notmuch-show-all-multipart/alternative-parts nil)
		;; (setq mime-edit-pgp-signers '("C84EF897"))
		;; (setq mime-edit-pgp-encrypt-to-self t)
		;; (setq mml2015-encrypt-to-self t)
		;; (setq mml2015-sign-with-sender t)
		;; (setq notmuch-crypto-process-mime t)

  (setq notmuch-always-prompt-for-sender t)
  ;; (setq notmuch-show-part-button-default-action: 'notmuch-show-view-part)

  (setq notmuch-fcc-dirs '(("m-takeuchi@kuee.kyoto-u.ac.jp" . "kumail/Sent")
						   ("takeuchi.mitsuaki.6w@kyoto-u.ac.jp" . "kumail/Sent")
						   ("m2takeuchi@gmail.com" . "m2gmail/Sent")))
  (setq notmuch-mua-compose-in 'current-window)
  (setq notmuch-show-indent-messages-width 2)
  (setq notmuch-saved-searches
		'((:name "inbox" :query "tag:inbox" :key "i")
		  (:name "kumail" :query "tag:kumail" :key "k")
		  (:name "kumail-inbox" :query "tag:kumail and tag:inbox" :key "K")
		  (:name "m2gmail" :query "tag:m2gmail" :key "g")
		  (:name "m2gmail-inbox" :query "tag:m2gmail and tag:inbox" :key "G")
		  (:name "unread" :query "tag:unread" :key "u")
		  (:name "flagged" :query "tag:flagged" :key "f")
  		  (:name "flagged-work" :query "tag:flagged and tag:kumail" :key "F")
  		  (:name "mail magazine" :query "tag:magazine" :key "m")
		  (:name "sent" :query "tag:sent" :key "t")
		  (:name "drafts" :query "tag:draft" :key "d")
		  (:name "archive" :query "-tag:inbox" :key "A")
		  (:name "all mail" :query "*" :key "a" :sort-order)))

)
