(use-package org
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
  :defer 2
  :config
  ;; RET will follow the link : nil --> t
  (setq org-return-follows-link t)
  ;; Directory with org files : "~/org" --> "~/Documents/org"
  (setq org-directory my-org-directory)

  (setq org-capture-templates
		'(
		  ("a" "Appointment" entry (file  "~/Dropbox/org/agenda/gcal.org" )
		   "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
		  ("t" "Todo" entry (file+headline "~/org/notes.org" "Tasks")
		   "* TODO %?\n  %i\n  %a")
		  ("j" "Journal" entry (file+datetree "~/org/journal.org")
		   "* %?\nEntered on %U\n  %i\n  %a")))
  ;; For MobileOrg
  (setq org-mobile-inbox-for-pull (concat my-org-directory "/flagged.org"))
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg/")
  ;; (setq org-agenda-files (list org-default-notes-file org-mobile-inbox-for-pull (concat org-directory "/memo.org")))
)

;; カレンダー calfw との連携
;; calfw <--> org-agenda
(use-package calfw-org)


(use-package org-gcal
  :config
  (setq org-gcal-client-id "962444117670-s71q0hh4ikaqalmiiju5tgb52llbpba6.apps.googleusercontent.com"
		org-gcal-client-secret (my:auth-source-get-passwd :port "org-gcal" :login org-gcal-client-id)
		org-gcal-file-alist '(("m2takeuchi@gmail.com" .  "~/org/agenda/gcal.org")))
  (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
  )


;; ;; agenda
;; ;; 時間表示が 1 桁の時, 0 をつける
;; (setq org-agenda-time-leading-zero t)

;; ;; 祝日を利用しない
;; ;; (setq calendar-holidays nil)

;; ;; DONE の時刻を記録
;; (setq org-log-done 'time)

;; ;; スケジュールやデッドラインアイテムは DONE になっていれば表示する
;; (setq org-agenda-skip-deadline-if-done nil)
;; (setq org-agenda-skip-scheduled-if-done nil)

;; ;; セレクションメニューから状態の変更を行えるようにする
;; (setq org-use-fast-todo-selection t)

;; ;; default で logbook を表示
;; (setq org-agenda-include-inactive-timestamps t)

;; ;; default で 時間を表示
;; (setq org-agenda-start-with-log-mode t)

;; ;;; 一ヶ月分を表示
;; (setq org-agenda-span 30)

;; ;;アジェンダの clockreport 用パラメータ
;; (setq org-agenda-clockreport-parameter-plist
;;       '(:maxlevel 5 :block t :tstart t :tend t :emphasize t :link t :narrow 80 :indent t :formula nil :timestamp t :level 5 :tcolumns nil :formatter nil))
