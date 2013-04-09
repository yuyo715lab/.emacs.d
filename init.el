;;load path
(setq load-path
      (append '("~/.emacs.d/site-lisp" "~/.emacs.d/site-lisp/yatex")
	      load-path))


;; backspace C-h 2012/5/29
	(global-set-key "\C-h" 'delete-backward-char)
;;ビープ音消す 2012/11/12
	(setq visible-bell t)
;; kakko 2012/12/9
	(show-paren-mode t)
;; Carbon Emacsの設定で入れられた. メニューを隠したり．
	(custom-set-variables
	 '(display-time-mode t)
	 '(tool-bar-mode nil)
	 '(transient-mark-mode t))
	(custom-set-faces
	 )
;; color
(progn
			    (set-background-color "Black")
			    (set-foreground-color "LightGray")
			    (set-cursor-color "Gray")
			    (set-frame-parameter nil 'alpha 80)
			    )

;; utf-8 2013/02/9
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; C-x C-f 初期値
(setq default-directory "c:/cygwin/home/tomohiro/")
;;auto install
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;anything
;; anything 2012/11/21
	(require 'anything-startup)
	(define-key global-map (kbd "C-l") 'anything)
	(setq anything-sources
	      '(anything-c-source-buffers+
		anything-c-source-recentf
		anything-c-source-man-pages
		anything-c-source-emacs-commands
		anything-c-source-emacs-functions
		anything-c-source-files-in-current-dir
		))


;;matlab mode


(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(setq matlab-indent-function t)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#500")

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; C-Ret で矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)



;;======================================================================
;; TeX
;;======================================================================
; YaTeX-mode
(setq auto-mode-alist  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;(setq tex-command "platex")
(setq YaTeX-dvi2-command-ext-alist
      '(("dviout" . ".dvi")
        ("psv" . ".ps")
        ("TeXworks\\|SumatraPDF\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))  ;;C-c t p のとき*.pdf と最初から表示
(setq tex-command "ptex2pdf -l -ot \"-kanji=utf8 -guess-input-enc -synctex=1\"")
;(setq dvi2-command "c:/w32tex/dviout/dviout")                   ;;ココdvioutのパス書く
;(setq dvi2-command "texworks")
(setq dvi2-command "start SumatraPDF -reuse-instance")
(setq dviprint-command-format "dvipdfmx %s ")
