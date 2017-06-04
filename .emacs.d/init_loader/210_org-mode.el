(use-package org
  :ensure t
  :mode (("\\.org\\'" . org-mode))
  :bind (("C-c l" . org-store-link)
		 ("C-c c" . org-capture)
		 ("C-c a" . org-agenda)
		 ("C-c b" . org-iswitchb))

  :init
  (setq my-org-directory "~/org/") ; link to ~/Dropbox/org
  ;; (setq my-org-agenda-directory "~/org/agenda/")
  ;; (setq org-agenda-files (list my-org-directory my-org-agenda-directory))
  (setq org-agenda-files '("~/org" "~/org/agenda"))
  ;; For org latex export
  (setq org-latex-pdf-process
		'("latexmk %f"))
  (setq org-latex-default-class "jsarticle")
  (setq org-latex-classes '(("jsarticle"
            "\\documentclass{jsarticle}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{amsmath,amssymb}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               ("jsbook"
            "\\documentclass{jsbook}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
            ("\\chapter{%s}" . "\\chapter*{%s}")
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               ))
  :defer 2
  :config
  (setq org-startup-indented t)			;デフォルトでインデント表示
  ;tagのショ-トカット
  (setq org-tag-alist '(("work" . ?w)
						("edu" . ?E)
						("conf" . ?c)
						("semi" . ?s)
						("lab" . ?l)
						("home" . ?h)
						("jobhant" . ?j)
						("IL3DP" . ?3)
						("mac" . ?m)
						("emacs" . ?e) ))
  (setq system-time-locale "C")			;曜日表記を英語にする
  ;; RET will follow the link : nil --> t
  (setq org-return-follows-link t)
  ;; Directory with org files : "~/org" --> "~/Documents/org"
  (setq org-directory my-org-directory)

  (setq org-capture-templates
		'(
		  ;; ("a" "Appointment" entry (file  "~/org/agenda/schedule.org" )
		   ;; "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
   		  ("a" "Appointment" entry (file  "~/org/agenda/gcal.org" )
   		   "* %?\n\n%^T\n\n")
		  ("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
		   "* TODO %?\nEntered on %U\n%a")
		  ("j" "Journal" entry (file+datetree "~/org/journal.org")
		   "* %?\nEntered on %U\n%i\n%a")))

  ;; agenda
  ;; 時間表示が 1 桁の時, 0 をつける
  (setq org-agenda-time-leading-zero t)

  ;; 祝日を利用しない
  ;; (setq calendar-holidays nil)

  ;; DONE の時刻を記録
  (setq org-log-done 'time)

  ;; スケジュールやデッドラインアイテムは DONE になっていれば表示する
  (setq org-agenda-skip-deadline-if-done nil)
  (setq org-agenda-skip-scheduled-if-done nil)

  ;; TODOの状態をカスタマイズ ‘!’ (for a timestamp) or ‘@’ (for a note with timestamp) 
  (setq org-todo-keywords
		'((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

  ;; ;; セレクションメニューから状態の変更を行えるようにする
  ;; (setq org-use-fast-todo-selection t)

  ;; ;; default で logbook を表示
  ;; (setq org-agenda-include-inactive-timestamps t)

  ;; ;; default で 時間を表示
  ;; (setq org-agenda-start-with-log-mode t)

  ;;; 0.5ヶ月分を表示
  (setq org-agenda-span 14)

  ;; ;;アジェンダの clockreport 用パラメータ
  ;; (setq org-agenda-clockreport-parameter-plist
  ;;       '(:maxlevel 5 :block t :tstart t :tend t :emphasize t :link t :narrow 80 :indent t :formula nil :timestamp t :level 5 :tcolumns nil :formatter nil))


  )


;; (use-package org-gcal
;;   :config
;;   (setq org-gcal-client-id "962444117670-s71q0hh4ikaqalmiiju5tgb52llbpba6.apps.googleusercontent.com"
;; 		org-gcal-client-secret (my:auth-source-get-passwd :port "org-gcal" :login org-gcal-client-id)
;; 		org-gcal-file-alist '(("m2takeuchi@gmail.com" .  "~/org/agenda/gcal.org")
;; 		("4u3ihjp7epih5fot8huvhk10k8@group.calendar.google.com" .  "~/org/agenda/gcal_private.org")))
;;   (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
;;   (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
;; )


;; emacsのカレンダーで日本の祝日にする.
(eval-after-load "holidays"
  '(progn
     (require 'japanese-holidays)
     (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
           (append japanese-holidays holiday-local-holidays holiday-other-holidays))
     (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
     ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
     ;; 変数はデフォルトで設定済み
     (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
           japanese-holiday-weekend-marker     ; 土曜日を水色で表示
           '(holiday nil nil nil nil nil japanese-holiday-saturday))
     (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
     (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
     ;; “きょう”をマークするには以下の設定を追加します。
     (add-hook 'calendar-today-visible-hook 'calendar-mark-today)))


;; カレンダー
(use-package calfw
  :ensure t
  :bind (("C-c C-f" . cfw:open-org-calendar))
  :init
  ;;cfw:org-capture-templateはcalfw-orgを
  ;;requireする前に評価しておいてください。
  (setq cfw:org-capture-template
		'("c" "calfw2org" entry 
		  (file "~/org/agenda/gcal.org")
		  "*  %?\n %(cfw:org-capture-day)"))

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

;; カレンダー calfw との連携
;; calfw <--> org-agenda
(use-package calfw-org
  ;; :ensure t
  :preface
  (defun cfw:open-calendar ()
	(interactive)
	(let ((cp
		   (cfw:create-calendar-component-buffer
			:view 'month
			:contents-sources
			(list 
			 (cfw:org-create-file-source
			  "work" "~/org/agenda/gcal.org" "#268bd2")
			 (cfw:org-create-file-source
			  "private" "~/org/agenda/gcal_private.org" "#859900")))))
	  (switch-to-buffer (cfw:cp-get-buffer cp))))

  )


;; ## Usage
;; (with-eval-after-load "ob"
;;   (require 'org-babel-eval-in-repl)
;;   (define-key org-mode-map (kbd "C-<return>") 'ober-eval-in-repl)
;;   (define-key org-mode-map (kbd "C-c C-c") 'ober-eval-block-in-repl))

;; ## Recommended config (optional):
;; (with-eval-after-load "eval-in-repl"
;;   (setq eir-jump-after-eval nil))

;; MTA notmuch との連携
(use-package org-notmuch
  :ensure org-plus-contrib)				;orgのリポジトリを追加しておく必要あり
