;;;; Visual settings

;; (load-theme 'adwaita t)
(load-theme 'deeper-blue t)
;; (load-theme 'misterioso t)
;; (load-theme 'manoj-dark t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'tango-dark t)
;; (load-theme 'wombat t)


(global-nlinum-mode t) ;;
(setq nlinum-format "%4d ");; 5 桁分の表示領域を確保する
;; Indent width
(setq default-tab-width 4) ; indent
;; No menu bar
(menu-bar-mode -1)


;; ;; タイトルバーwith時計
;; (when (window-system)
;;   (run-with-timer 5 5 (lambda ()
;;   (setq display-time-day-and-date t
;;     display-time-24hr-format t)
;;   (setq display-time-string-forms
;;     '((if display-time-day-and-date
;;       (format "%s/%s/%s " year month day)
;;         "")
;;       (format "%s:%s%s"
;;         (if display-time-24hr-format 24-hours 12-hours)
;;         minutes
;;         (if display-time-24hr-format "" am-pm))))
;;   (display-time)
;;   (setq frame-title-format
;;     (concat "[" display-time-string "]"
;;             " - "
;;             (if (buffer-file-name)
;;             (format "%%f")
;;             (format "%%b"))))
;;   )))

(display-time-mode 1)     ; 時計表示
(display-battery-mode 1)  ; バッテリー表示

;; フォント設定
(when (and (>= emacs-major-version 24) (not (null window-system)))
  ;; (let* ((font-family "Menlo")
  (let* ((font-family "Ricty for Powerline")
         (font-size 14)
         (font-height (* font-size 10))
         (jp-font-family "ヒラギノ角ゴ ProN"))
         ;; (jp-font-family "Ricty for Powerline"))
    (set-face-attribute 'default nil :family font-family :height font-height)
    (let ((name (frame-parameter nil 'font))
          (jp-font-spec (font-spec :family jp-font-family))
          (jp-characters '(katakana-jisx0201
                           cp932-2-byte
                           japanese-jisx0212
                           japanese-jisx0213-2
                           japanese-jisx0213.2004-1))
          (font-spec (font-spec :family font-family))
          (characters '((?\u00A0 . ?\u00FF)    ; Latin-1
                        (?\u0100 . ?\u017F)    ; Latin Extended-A
                        (?\u0180 . ?\u024F)    ; Latin Extended-B
                        (?\u0250 . ?\u02AF)    ; IPA Extensions
                        (?\u0370 . ?\u03FF)))) ; Greek and Coptic
      (dolist (jp-character jp-characters)
        (set-fontset-font name jp-character jp-font-spec))
      (dolist (character characters)
        (set-fontset-font name character font-spec))
      (add-to-list 'face-font-rescale-alist (cons jp-font-family 1.2))
	  )))


;; No tool bar
(tool-bar-mode 0)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "DarkOrange")

;; 括弧を強調
(show-paren-mode t)
(setq show-paren-delay 0)
;; (setq show-paren-style 'expression)
;; (set-face-attribute 'show-paren-match-face nil
;;                     :background nil :foreground nil
;;                     :underline "#ffff00" :weight 'extra-bold)

;; mouse scrolling
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))


;====================================
;フレーム位置設定(ウィンドウ） 
;====================================
(setq initial-frame-alist
      (append
       '((top . 20)    ; フレームの Y 位置(ピクセル数)
     (left . 700)    ; フレームの X 位置(ピクセル数)
   (width . 100)    ; フレーム幅(文字数)
    (height . 62)   ; フレーム高(文字数)
    ) initial-frame-alist))
(setq default-frame-alist initial-frame-alist)



;最小の e2wm 設定例
(use-package e2wm
  :bind (("M-+" . e2wm:start-management)))


;; Show color
(use-package rainbow-mode
  :diminish rainbow-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'less-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode))



;; タブエディタ化
(use-package tabbar
  :bind (("M-]" . tabbar-forward-tab)
		 ("M-[" . tabbar-backward-tab)
		 ("C-M-]" . tabbar-forward-group)
		 ("C-M-[" . tabbar-backward-group))

  :config
  (tabbar-mode)
  (tabbar-mwheel-mode nil)                  ;; マウスホイール無効
  (setq tabbar-buffer-groups-function nil)  ;; グループ無効
  (setq tabbar-use-images nil)              ;; 画像を使わない
  ;; ;;----- 左側のボタンを消す
  ;; (dolist (btn '(tabbar-buffer-home-button
  ;;                tabbar-scroll-left-button
  ;;                tabbar-scroll-right-button))
  ;;   (set btn (cons (cons "" nil)
  ;;                  (cons "" nil))))

  ;;----- タブのセパレーターの長さ
  (setq tabbar-separator '(1.0))

  ;;----- タブの色（CUIの時。GUIの時は後でカラーテーマが適用）
  (set-face-attribute
   'tabbar-default nil
   :background "brightblue"
   :foreground "white"
   )
  (set-face-attribute
   'tabbar-selected nil
   :background "#ff5f00"
   :foreground "brightwhite"
   :box nil
   )
  (set-face-attribute
   'tabbar-modified nil
   :background "brightred"
   :foreground "brightwhite"
   :box nil
   )

  ;;----- 表示するバッファ
  ;; (defvar my-tabbar-displayed-list
  ;;   (rx "*scratch*" "*notmuch*" "*mail*"))

  ;; (defvar my-tabbar-displayed-buffers
  ;;   '("*scratch*" "*Backtrace*" "*Colors*" "*Faces*" "*notmuch-*" "*unsent mail*"))
  ;; "*Regexps matches buffer names always included tabs.")

  ;; ---- 表示しないバッファ
  (setq my-tabbar-x-list
		(rx "*helm"
			"*init log*"
			;; "Map_Sym.txt"
			;; ".ipa"
			))


  ;; 1. buffer-list を lambda関数の変数buffer で参照.
  ;; 2. buffer-name により buffer-list内のバッファ名を取得
  ;; 3. aref によりバッファ名の0番要素を取得
  ;; 4. "(find item sequence) ==> itemと等しい最初の要素を返す" により
  ;;    my-tabbar-x-listから3で取得した要素と等しい最初の要素を返す.
  ;; 5. "(remove-if predicate sequence)により predicateが真となる要素を取りのぞく" により
  ;;    buffer-listから4の要素を取り除く
  (defun my-tabbar-buffer-list ()
	(remove-if
	 (lambda (buffer) (find (aref (buffer-name buffer) 0) my-tabbar-x-list))
	 ;; (lambda (buffer) (find (aref (buffer-name buffer) 1) my-tabbar-x-list) )
	 (buffer-list)
	 ;; (add-to-list 'buffer-list my-tabbar-displayed-buffers)
	 ))

  (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
)


;; カレンダー
(use-package calfw
  :ensure t
  :bind (("C-c C-f" . cfw:open-org-calendar))
  :config
  ;; First day of the week
  (setq calendar-week-start-day 1) ; 0:Sunday, 1:Monday

  (when (window-system)
  ;; Default setting
  ;; (setq cfw:fchar-junction ?+
  ;; 		cfw:fchar-vertical-line ?|
  ;; 		cfw:fchar-horizontal-line ?-
  ;; 		cfw:fchar-left-junction ?+
  ;; 		cfw:fchar-right-junction ?+
  ;; 		cfw:fchar-top-junction ?+
  ;; 		cfw:fchar-top-left-corner ?+
  ;; 		cfw:fchar-top-right-corner ?+ )

  ;; Unicode characters
  (setq cfw:fchar-junction ?╋
		cfw:fchar-vertical-line ?┃
		cfw:fchar-horizontal-line ?━
		cfw:fchar-left-junction ?┣
		cfw:fchar-right-junction ?┫
		cfw:fchar-top-junction ?┯
		cfw:fchar-top-left-corner ?┏
		cfw:fchar-top-right-corner ?┓)

  ;; Another unicode chars
  ;; (setq cfw:fchar-junction ?╬
  ;; 		cfw:fchar-vertical-line ?║
  ;; 		cfw:fchar-horizontal-line ?═
  ;; 		cfw:fchar-left-junction ?╠
  ;; 		cfw:fchar-right-junction ?╣
  ;; 		cfw:fchar-top-junction ?╦
  ;; 		cfw:fchar-top-left-corner ?╔
  ;; 		cfw:fchar-top-right-corner ?╗)
  )
  )
;; calfw <--> google calendar
(use-package calfw-gcal
  :ensure t)
