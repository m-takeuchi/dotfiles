;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path
   '(
     "~/dotfiles/my_private_layer"
     )
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     csv
     python
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory "~/dotfiles/snippets")
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (latex :variables
            latex-build-command "LatexMk"
            latex-enable-folding t)
     pdf-tools
     extra-langs
     emoji ;; :+1:
     (ibuffer :variables ibuffer-group-buffers-by 'modes) ;modes or projects or nil
     twitter
     w3m
     (osx :variables
          osx-dictionary-dictionary-choice "Japanese-Englsh"
          ;; osx-use-dictionary-app nil
          )
     ipython-notebook
     ;; javascrit
     ;; spell-checkings
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ddskk
     cp5022x
     notmuch
     helm-notmuch
     org-gcal
     ob-ipython
     migemo
     gnus-alias
     outline-magic
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     org-projectile
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               ;; "Source Code Pro"
                               "Menlo"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meanIng of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  
  ;;このファイル末尾にcustom-set-variablesを羅列させない
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))

  ;; For compiling pdf-tools
  (setenv "PKG_CONFIG_PATH" "/usr/local/opt/zlib/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig")
  (setenv "XAPIAN_CJK_NGRAM" "1")       ;For japanese search in notmuch

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; 日本語マニュアル
  (add-to-list 'Info-directory-list "~/info/")
  (defun Info-find-node--info-ja (orig-fn filename &rest args)
    (apply orig-fn
           (pcase filename
             ("emacs" "emacs251-ja")
             (t filename))
           args))
  (advice-add 'Info-find-node :around 'Info-find-node--info-ja)

  ;; shellのpathを引き継ぐ
  (with-eval-after-load 'exec-path-from-shell
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize))
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-copy-env "PATH")
    )

  ;; 自宅のiMacで使用している場合はcommandキーをmetaキーとして設定する
  (when (system-name) "Mitsuaki-no-iMac.local"
        (setq ns-command-modifier (quote meta)))

  ;; For reordering notmuch buffer
  (push "\\*notmuch-.+\\*" spacemacs-useful-buffers-regexp)
  ;; C-x C-c で容易にEmacsを終了させないように質問する.
  (setq confirm-kill-emacs 'y-or-n-p)

  ;; original keybindings ここに設定で良いのだろうか？
  (progn
    (bind-key "C-h" 'delete-backward-char) ;; Set C-h to backspace
    (bind-key "C-\\" 'hs-toggle-hiding)    ;; コードの折り畳み
    (bind-key "C-x C-j"  'skk-mode)        ;; skk
    (bind-key "C-x t"    'helm-imenu)
    (bind-key "C-x C-f"  'helm-find-files)
    (bind-key "M-y"      'helm-show-kill-ring)
    (bind-key "M-r"      'helm-resume)
    ;; (bind-key "C-\\"      'spacemacs/fold-transient-state/origami-toggle-all-nodes)
    )

  ;;; mostly equivalent (see below about fallbacks) but shorter:
  ;; (setq auth-sources '((:source "~/dotfiles_secret/google_dev.gpg")))
  ;;; even shorter and the _default_:
  (setq auth-sources '("~/dotfiles_secret/google_dev.gpg"
                       "~/dotfiles_secret/email_keys.gpg"
                       "~/dotfiles_secret/kuins_ssh_pass.gpg"))
  
  ;; EasyPGを利用したmy関数 googleカレンダーにアクセスする用
  (require 'cl)
  (defun* my:auth-source-get-passwd (&rest spec &allow-other-keys)
    (let ((founds (apply 'auth-source-search spec)))
      (when founds
        (funcall (plist-get (nth 0 founds) :secret)))))

  ;; コード折り畳みorigamiのカスタマイズ http://emacs.rubikitch.com/origami/
  (with-eval-after-load 'origami
    (require 'outline-magic)            ;http://emacs.rubikitch.com/outline-magic/
    ;; (makunbound 'origami-view-mode-map)
    (define-minor-mode origami-view-mode
      "TABにorigamiの折畳みを割り当てる"
      nil "折紙"
      '(("\C-i" . origami-cycle))
      (or origami-mode (origami-mode 1)))
    (defun origami-cycle (recursive)
      "origamiの機能をorg風にまとめる"
      (interactive "P")
      (call-interactively
       (if recursive 'origami-toggle-all-nodes 'origami-toggle-node)))
    (defun view-mode-hook--origami ()
      (when (memq major-mode (mapcar 'car origami-parser-alist))
        (origami-view-mode (if view-mode 1 -1))))
    (add-hook 'view-mode-hook 'view-mode-hook--origami)

  )

  ;; 日本語入力ddskk
  (with-eval-after-load 'skk
    (bind-key "C-j"  'skk-kakutei-key) ;; iterm2 では'C-;'をSend Hex Codeとして '0x18 0x40 0x63 0x3b'と値を入力すればターミナル上でも'C-;'が効く
    (unbind-key "$" skk-j-mode-map)		;かなモードで$入力時に漢字コードを表示するのを無効化する
    (setq mac-pass-control-to-system nil)
    ;; skkserv
    (setq skk-server-host "127.0.0.1")
    (setq skk-server-portnum 1178)
    ;; user dictionary
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
	          ("-" nil ("ー" . "-" ))		;(入力される文字列 出力後に自動的に入力に追加される文字列 出力)     出力は ("ア" . "あ") のようなコンスセル
		        ;; ("@" nil "＠")
		        ;; ("!" nil "!")
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
    ;; (setq skk-date-ad t)
    (setq skk-number-style nil)
    ;; 送り仮名が厳密に正しい候補を優先
    (setq skk-henkan-strict-okuri-precedence t)
    ;; 辞書の共有
    (setq skk-share-private-jisyo t)
    )


  ;; Email with notmuch, mbsync, and my shell scripts
  (use-package notmuch
    :preface
    ;; メールの受信とnotmuchを実行
    (defun mailsync ()
      (interactive)
      (async-shell-command "~/bin/mailsync.sh"))
    ;; リンクを規定ブラウザで開く
    (when (equal system-type 'darwin)
	    (setq browse-url-browser-function 'browse-url-default-macosx-browser)
      ;; (setq browse-url-browser-function 'w3m-browse-url)
	    )
    (when (equal system-type 'linux)
   	  (setq browse-url-browser-function 'eww-browse-url))

    ;; 日本語に関する設定
    (setq mm-coding-system-priorities
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
    (require 'gnus-alias)
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
		        (message-forward-as-mime nil) ; nil --> rfc822添付ではなくインライン化
		        (message-forward-ignored-headers ".*") ; 正規表現に一致するヘッダを無視
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

    :bind (("C-c m" . notmuch)     ;; C-c m opens up Notmuch from any buffer
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
 		        (:name "m2gmail-NotDODA" :query "tag:m2gmail and not (from:doda.jp or from:persol.co.jp)" :key "j")
		        (:name "m2gmail" :query "tag:m2gmail" :key "g")
		        (:name "m2gmail-inbox" :query "tag:m2gmail and tag:inbox" :key "G")
		        (:name "unread" :query "tag:unread" :key "u")
		        (:name "flagged" :query "tag:flagged" :key "f")
  		      (:name "flagged-work" :query "tag:flagged and tag:kumail" :key "F")
  		      (:name "mail magazine" :query "tag:magazine" :key "m")
		        (:name "sent" :query "tag:sent" :key "t")
		        (:name "drafts" :query "tag:draft" :key "d")
		        (:name "archive" :query "-tag:inbox" :key "A")
		        ;; (:name "all mail" :query "*" :key "a" :sort-order)
            (:name "all mail" :query "*" :key "a")
            )))

  ;; org-mode
  (with-eval-after-load 'org
    (setq my-org-directory "~/org/") ; link to ~/Dropbox/org
    (setq my-org-agenda-directory "~/org/agenda/")
    (setq org-agenda-files (list my-org-directory my-org-agenda-directory))
    ;; (setq org-agenda-files (list my-org-directory))
    ;; (setq org-agenda-files '("~/org/todo.org"
    ;;                          "~/org/journal.org"))
    ;; ;;                          ;; "/Users/m-takeuchi/org/agenda/"))
    ;; Directory with org files
    (setq org-directory my-org-directory)

    ;; For notmuch support
    (require 'org-notmuch)

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
    ;; Size of latex formula
    (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

    (setq org-export-latex-table-caption-above t) ;表のキャプションは上
    (setq org-startup-indented t)			;デフォルトでインデント表示
    ;; tagのショ-トカット
    (setq org-tag-alist '(("KyotoUniv" . ?k)
						              ("edu" . ?E)
                          ("RHESCA" . ?R)
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
    (setq org-capture-templates
		      '(
		        ("s" "Schedule" entry (file  "~/org/agenda/schedule.org" )
		        "* %?\n  %^T\n:PROPERTIES:\n:END:\n")
   		      ("a" "Appointment" entry (file  "~/org/agenda/gcal.org" )
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
    (setq org-agenda-skip-deadline-if-done t)
    (setq org-agenda-skip-scheduled-if-done t)

    ;; TODOの状態をカスタマイズ ‘!’ (for a timestamp) or ‘@’ (for a note with timestamp) 
    (setq org-todo-keywords
		      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
    (setq org-todo-keyword-faces
		      '(("TODO(t)" . org-warning)
		        ("WAIT" . "yellow")
		        ("CANCELED" . (:foreground "blue" :weight bold))
		        ))

    ;; セレクションメニューから状態の変更を行えるようにする
    ;; (setq org-use-fast-todo-selection t)
    ;; default で logbook を表示(終ったToDoまでアジェンダカレンダーに表示する)
    ;; (setq org-agenda-include-inactive-timestamps t)
    ;; default で 時間を表示
    (setq org-agenda-start-with-log-mode t)
    ;; 0.5ヶ月分を表示
    (setq org-agenda-span 14)
    ;;アジェンダの clockreport 用パラメータ <-- spacemacsが綺麗にしてくれてるのでいらん?
    ;; (setq org-agenda-clockreport-parameter-plist
    ;;       '(:maxlevel 5 :block t :tstart t :tend t :emphasize t :link t :narrow 80 :indent t :formula nil :timestamp t :level 5 :tcolumns nil :formatter nil))
    ;; inline imageのサイズ
    ;; (setq org-image-actual-width nil)
    ;; (add-to-list 'image-file-name-extensions "bmp")
    (setq org-image-actual-width (/ (display-pixel-width) 3)) ;インライン画像のサイズをウインド幅の1/3に
    (setq org-startup-with-inline-images t) ;; いつもインライン表示

    ;; orgにgoogleカレンダーを取り込む
    (require 'org-gcal)
    (setq org-gcal-client-id "962444117670-1e7hvul636qj3g0l6egmnojjeh1bno9m.apps.googleusercontent.com"
		      org-gcal-client-secret (my:auth-source-get-passwd :port "org-gcal" :login org-gcal-client-id)
		      org-gcal-file-alist
		      '(("m2takeuchi@gmail.com" .  "~/org/agenda/gcal.org")
		        ("4u3ihjp7epih5fot8huvhk10k8@group.calendar.google.com" .  "~/org/agenda/gcal_private.org")))
    ;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
    ;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
    (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-fetch) ))
    (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-fetch) ))

    ;; コードを評価するとき尋ねない
    (setq org-confirm-babel-evaluate nil)
    ;; ソースコードを書き出すコマンドの設定とキーバインド
    (defun org-babel-tangle-and-execute ()
      (interactive)
      (org-babel-tangle)
      (org-babel-execute-buffer)
      (org-display-inline-images))
      ;; (define-key org-mode-map (kbd "C-c C-v m") 'org-babel-tangle-and-execute)
    ;; babelをアクティベイトする言語
    (org-babel-do-load-languages 'org-babel-load-languages 
							                   '((emacs-lisp . t)
							                     (C . t)
								                   (shell . t)
								                   (latex . t)
								                   (org . t)
								                   (python . t)
                                   (ipython . t)))

    )

  ;; Jupyter/IPython in org-mode
  ;; (use-package ob-ipython
  ;;   :preface
  ;;   ;; ソースコードを書き出すコマンド
  ;;   (defun org-babel-tangle-and-execute ()
	;;     (interactive)
	;;     (org-babel-tangle)
	;;     (org-babel-execute-buffer)
	;;     (org-display-inline-images))
  ;;   :bind ( :map org-mode-map
	;; 		           ("C-c C-v C-m" . org-babel-tangle-and-execute)
	;; 	             )
  ;;   :config
  ;;   ;; For avoiding error message described in https://github.com/gregsexton/ob-ipython/issues/89
  ;;   (setq ob-ipython-command "ipython3")
  ;;   ;; コードを評価するとき尋ねない
  ;;   (setq org-confirm-babel-evaluate nil)
  ;;   ;; display/update images in the buffer after I evaluate
  ;;   (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  ;;   )

  ;; migemo
  (use-package migemo
    :if (and (executable-find "cmigemo") (require 'migemo nil t)) ;migemoインストールされてれば
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

  ;; Latex setting
  (add-hook 'LaTeX-mode-hook
     (function (lambda ()
       (add-to-list 'TeX-command-list '("LatexMk" ; latexmkではなくLatexMk
           "latexmk -pvc %t"
            TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
       (add-to-list 'TeX-command-list '("Lualatex"
                                     "/Library/TeX/texbin/lualatex %t"
                                     TeX-run-TeX nil (latex-mode) :help
                                     "Run Lualatex"))
       ;; (add-to-list 'TeX-command-list '("Latexmk-upLaTeX-pdfdvi"
       ;;                               "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
       ;;                               TeX-run-TeX nil (latex-mode) :help "Run Latexmk-upLaTeX-pdfdvi"))
       (add-to-list 'TeX-command-list '("Latexmk-pdfLaTeX"
                                     "/Library/TeX/texbin/latexmk -e '$pdflatex=q/pdflatex %%O %S %(mode) %%S/' -e '$bibtex=q/bibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk-pdfLaTeX"))
       (add-to-list 'TeX-command-list '("Latexmk-LuaLaTeX"
                                     "/Library/TeX/texbin/latexmk -e '$pdflatex=q/lualatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaLaTeX"))
       ;; (add-to-list 'TeX-command-list '("Latexmk-LuaJITLaTeX"
       ;;                               "/Library/TeX/texbin/latexmk -e '$pdflatex=q/luajitlatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
       ;;                               TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaJITLaTeX"))
       ;; (add-to-list 'TeX-command-list '("Latexmk-XeLaTeX"
       ;;                               "/Library/TeX/texbin/latexmk -e '$pdflatex=q/xelatex %%O %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %t"
       ;;                               TeX-run-TeX nil (latex-mode) :help "Run Latexmk-XeLaTeX"))
       (add-to-list 'TeX-command-list '("displayline"
                                     "/Applications/Skim.app/Contents/SharedSupport/displayline %n %s.pdf \"%b\""
                                     TeX-run-discard-or-function t t :help "Forward search with Skim"))
       (add-to-list 'TeX-command-list '("Skim"
                                     "/usr/bin/open -a Skim.app %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Skim"))
       (add-to-list 'TeX-command-list '("Preview"
                                     "/usr/bin/open -a Preview.app %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Preview"))
       (add-to-list 'TeX-command-list '("acroread"
                                     "/usr/bin/open -a \"Adobe Acrobat Reader DC.app\" %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Adobe Acrobat Reader DC"))
       ))
  )

  ;; Pdf prevew with pdf-tools
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
         TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
         TeX-source-correlate-start-server t)
  ;; refresh buffer
  (add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
  ;; (setq preview-image-type 'dvipng)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)


  (with-eval-after-load 'tex-jp
    (setq TeX-engine-alist '((pdfuptex "pdfupTeX"
                                     "/Library/TeX/texbin/ptex2pdf -u -e -ot '%S %(mode)'"
                                     "/Library/TeX/texbin/ptex2pdf -u -l -ot '%S %(mode)'"
                                     "euptex")))
    (setq japanese-TeX-engine-default 'pdfuptex)
    ;(setq japanese-TeX-engine-default 'luatex)
    ;(setq japanese-TeX-engine-default 'xetex)
    ;; pdfview and auctex
    
    ;; (setq TeX-view-program-selection '((output-dvi "displayline")
    ;;                                    (output-pdf "displayline")))
    ;; (setq TeX-view-program-selection '((output-dvi "Skim")
    ;;                                  (output-pdf "Skim")))
    ;; (setq japanese-LaTeX-default-style "bxjsarticle")
    ;; (setq japanese-LaTeX-default-style "ltjsarticle")
    (dolist (command '("pTeX" "pLaTeX" "pBibTeX" "jTeX" "jLaTeX" "jBibTeX" "Mendex"))
    (delq (assoc command TeX-command-list) TeX-command-list)) )

  ;; w3m
  (defun dotspacemacs/user-config ()
    (setq w3m-home-page "https://www.google.com")
    ;; W3M Home Page
    (setq w3m-default-display-inline-images t)
    (setq w3m-default-toggle-inline-images t)
    ;; W3M default display images
    (setq w3m-command-arguments '("-cookie" "-F"))
    (setq w3m-use-cookies t)
    ;; W3M use cookies
    (setq browse-url-browser-function 'w3m-browse-url)
    ;; Browse url function use w3m
    (setq w3m-view-this-url-new-session-in-background t)
    ;; W3M view url new session in background
  )

  ;; ;; Weblioで辞書検索
  ;; (autoload 'dic-lookup-w3m "dic-lookup-w3m" "w3mで辞書を引く" t)
  ;; (setq w3m-key-binding 'info)
  ;; (global-set-key "\C-ch"
  ;; ;; (bind-key "C-c h"
  ;;   (lambda()
  ;;   (interactive)
  ;;   (dic-lookup-w3m "ej-weblio")))
)
