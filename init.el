;;load path
(setq load-path
      (append '("~/.emacs.d/site-lisp" "~/.emacs.d/site-lisp/yatex")
	      load-path))


;; backspace C-h 2012/5/29
	(global-set-key "\C-h" 'delete-backward-char)
;;�r�[�v������ 2012/11/12
	(setq visible-bell t)
;; kakko 2012/12/9
	(show-paren-mode t)
;; Carbon Emacs�̐ݒ�œ����ꂽ. ���j���[���B������D
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

;; C-x C-f �����l
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

;; �^�C�g���o�[�Ƀt�@�C���̃t���p�X�\��
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; ���ʂ͈͓̔��������\��
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; ���ʂ͈̔͐F
(set-face-background 'show-paren-match-face "#500")

;; �s�ԍ��\��
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; �X�N���[���o�[��\��
(set-scroll-bar-mode nil)

;; yes or no��y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; C-Ret �ŋ�`�I��
;; �ڂ����L�[�o�C���h����Fhttp://dev.ariel-networks.com/articles/emacs/part5/
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
        ("TeXworks\\|SumatraPDF\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))  ;;C-c t p �̂Ƃ�*.pdf �ƍŏ�����\��
(setq tex-command "ptex2pdf -l -ot \"-kanji=utf8 -guess-input-enc -synctex=1\"")
;(setq dvi2-command "c:/w32tex/dviout/dviout")                   ;;�R�Rdviout�̃p�X����
;(setq dvi2-command "texworks")
(setq dvi2-command "start SumatraPDF -reuse-instance")
(setq dviprint-command-format "dvipdfmx %s ")