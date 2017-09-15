(use-package org
  :ensure t
  :mode (("\\.org\\'" . org-mode))
  :bind (("C-c l" . org-store-link)
		 ("C-c c" . org-capture)
		 ("C-c a" . org-agenda)
		 ("C-c b" . org-iswitchb))

  :init
  (setq my-org-directory "~/org/") ; link to ~/Dropbox/org
  (setq my-org-agenda-directory "~/org/agenda/")
  (setq org-agenda-files (list my-org-directory my-org-agenda-directory))
  ;; (setq org-agenda-files '("~/org" "~/org/agenda"))

  ;; For org latex export
  (setq org-latex-pdf-process
		;; '("latexmk %f"))
  		'("latexmk -lualatex %f"))
  		;; '("lualatex %f"))
  ;; (setq org-latex-default-class "jsarticle")
  (setq org-latex-default-class "ltjsarticle")
  (setq org-latex-classes '(
               ("ltjsarticle"
               "\\documentclass{ltjsarticle}
\\usepackage{amsmath,amssymb}
\\usepackage{listings}
\\usepackage[safe]{tipa}
\\usepackage[no-math]{fontspec}
\\usepackage{luatexja}
\\usepackage{amsmath,amssymb}
\\usepackage{listings}
\\usepackage[safe]{tipa}
\\usepackage[no-math]{fontspec}
\\usepackage{luatexja-otf}
\\usepackage[match]{luatexja-fontspec}
\\usepackage[hiragino-pron,deluxe,expert]{luatexja-preset}
\\usepackage{booktabs}
\\usepackage{tabularx}
\\usepackage{tikz}               %tikzでダイアグラムを作図
\\usetikzlibrary{arrows.meta}    %tikzの拡張ライブラリ読み込み
\\usepackage{pgfplots}
\\usetikzlibrary{arrows,quotes,angles}
\\usetikzlibrary{positioning,calc}
\\usepackage{textpos}               %紙面絶対位置でテキストボックスを入れる
\\usepackage[pdftex,pdfencoding=auto]{hyperref}
\\usepackage{svg}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
			("jsarticle"
            "\\documentclass{jsarticle}
\\usepackage[dvipdfmx]{color}
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
  ;; Table of contents(toc) select
  (defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
  (setq org-export-latex-format-toc-function 'org-export-latex-no-toc) ;no toc

  :defer 2
  :config
  ;; Size of latex formula
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

  (setq org-export-latex-table-caption-above t) ;表のキャプションは上
  (setq org-startup-indented t)			;デフォルトでインデント表示
  ;tagのショ-トカット
  (setq org-tag-alist '(("work" . ?w)
						("edu" . ?E)
						("duty" . ?d)
						("conf" . ?c)
						("semi" . ?s)
						("lab" . ?l)
						("RBS" . ?r)
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
   		  ;; ("a" "Appointment" entry (file  "~/org/agenda/schedule.org" )
   		  ("a" "Appointment" entry (file  "~/org/agenda/gcal.org" )
   		   ;; "* %?\n\n%^T\n\n")
		   ;; "* %?\n%a")
		   "* %?\n  %^T\n\n")
		  ("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
		   "* TODO %?\nEntered on %U\n%a")
		  ("j" "Journal" entry (file+datetree "~/org/journal.org")
		   "* %?\nEntered on %U\n%i\n%a")
		  ("J" "Jobhant" entry (file+headline "~/org/jobhant.org" "Jobhant")
		   "* %?\nEntered on %U\n%a\n")
		  ("p" "Project" entry (file+headline "~/org/project.org" "Project")
		   "* %?\nEntered on %U\n%a\n")
		))

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
  (setq org-todo-keyword-faces
		'(("TODO(t)" . org-warning)
		  ("WAIT" . "yellow")
		  ("CANCELED" . (:foreground "blue" :weight bold))
		  ))

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

  ;; inline imageのサイズ
  (setq org-image-actual-width nil)
  ;; (add-to-list 'image-file-name-extensions "bmp")

  ;; いつもインライン表示
  (setq org-startup-with-inline-images t)
  )


(use-package org-gcal
  :config
  (setq org-gcal-client-id "962444117670-1e7hvul636qj3g0l6egmnojjeh1bno9m.apps.googleusercontent.com"
		org-gcal-client-secret (my:auth-source-get-passwd :port "org-gcal" :login org-gcal-client-id)
		org-gcal-file-alist
		'(("m2takeuchi@gmail.com" .  "~/org/agenda/gcal.org")
		("4u3ihjp7epih5fot8huvhk10k8@group.calendar.google.com" .  "~/org/agenda/gcal_private.org")))
  ;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  ;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
  (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-fetch) ))
  (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-fetch) ))
)


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
;; (use-package calfw-gcal
;;   :ensure t)

;; calfw <--> ical, etc, google calendar
(use-package calfw-ical)



;; カレンダー calfw との連携
;; calfw <--> org-agenda
(use-package calfw-org
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
  			  "private" "~/org/agenda/gcal_private.org" "#859900")
  			 (cfw:org-create-file-source
  			  "work_local" "~/org/agenda/schedule.org" "#F68FFF")
  			 ))))
  	  (switch-to-buffer (cfw:cp-get-buffer cp))))
  (defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    ;; (cfw:howm-create-source "Blue")  ; howm source
    ;; (cfw:cal-create-source "Orange") ; diary source
    ;; (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "gcal" "https://calendar.google.com/calendar/ical/m2takeuchi%40gmail.com/private-3c5c7483ac28e4d9cc6cbbef891011ed/basic.ics" "IndianRed") ; google calendar ICS
	)))
    :bind (("C-c f" . cfw:open-calendar))
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

;; org --> latexにおいてsubfigureを使う
(use-package ox-latex-subfigure
  :init
  (setq org-latex-caption-above nil
        org-latex-prefer-user-labels t)
  :load-path "~/.emacs.d/site-lisp/ox-latex-subfigure/"
  :config (require 'ox-latex-subfigure))


;; ipython
(use-package ob-ipython
  :preface
  ;; ソースコードを書き出すコマンド
  (defun org-babel-tangle-and-execute ()
	(interactive)
	(org-babel-tangle)
	(org-babel-execute-buffer)
	(org-display-inline-images))
  :bind ( :map org-mode-map
			  ("C-c C-v C-m" . org-babel-tangle-and-execute)
		 )
  :config
  ;; For avoiding error message described in https://github.com/gregsexton/ob-ipython/issues/89
  (setq ob-ipython-command "ipython3")
  ;; コードを評価するとき尋ねない
  (setq org-confirm-babel-evaluate nil)
  ;;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
)

;; babelをアクティベイトする言語
(org-babel-do-load-languages 'org-babel-load-languages 
							   '((emacs-lisp . t)
								 (shell . t)
								 (latex . t)
								 (org . t)
								 (python . t)
                               (ipython . t)))
