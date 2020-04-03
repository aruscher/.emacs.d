(defvar *personal/backup-directory*
  (expand-file-name "backup/" user-emacs-directory))

(defvar *personal/custom-file*
  (expand-file-name "custom.el" user-emacs-directory))

;; Create backup directory if not exist
(unless (file-exists-p *personal/backup-directory*)
  (mkdir *personal/backup-directory*))

;; Set backup directory
(setq backup-directory-alist
      `(("." . ,*personal/backup-directory*)))

;; set custom file
(setq custom-file *personal/custom-file*)

;; create custom file if not exist
(unless (file-exists-p custom-file)
  (with-temp-buffer
    (write-file custom-file)))

;; load custom file
(load custom-file)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable blinking cursor		 
(blink-cursor-mode -1)

;; Disable scroll all mode
(scroll-all-mode -1)

;; Disable emacs start screen
(setq inhibit-splash-screen t)

;; Remap yes-or-no to y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Show matchting parens
(show-paren-mode t)

;; Highlight current line
(global-hl-line-mode t)

;; Show line numbers
(global-display-line-numbers-mode t)

;; Show column numbers
(setq column-number-mode t)

;; Use ibuffer for list-buffers
(defalias 'list-buffers 'ibuffer)

;; Set hack as default font
(set-face-attribute 'default nil
		    :family "Hack"
		    :height 110
		    :weight 'normal
		    :width 'normal)

(require 'package)
(setq package-enable-at-startup nil)

;; Configure package archieves
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; Init package
(package-initialize)

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install auto-package-update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-prompt-before-update t
	auto-package-update-interval 7)
  (auto-package-update-maybe))

;; Load Spacemacs
(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; Ace-Window to quickly move a round windows
(use-package ace-window
  :ensure t
  :bind ("C-c o" . 'ace-window))

;; Install dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner nil)
  (setq dashboard-items
	'((recents . 5)
	  (projects .5)))
  (dashboard-setup-startup-hook))

;; Install which-key
(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; Install helm
(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files))
  :config
  (setq helm-mode-fuzzy-match t)
  (helm-mode 1))

;; Install helm for projectile
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package pdf-tools
  :ensure t
  :hook (pdf-view-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (pdf-tools-install)
  (add-to-list 'auto-mode-alist (cons "\\.pdf$" 'pdf-view-mode))
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t)
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

(defun bjm/elfeed-load-db-and-open ()
    (interactive)
    (elfeed-db-load)
    (elfeed)
    (elfeed-search-update--force))

(defun bjm/elfeed-save-db-and-bury ()
  (interactive)
  (elfeed-db-save)
  (elfeed-db-compact)
  (quit-window))

(defun bjm/elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
	      ("q" . bjm/elfeed-save-db-and-bury)
	      ("Q" . bjm/elfeed-save-db-and-bury))
  :config
  (setq elfeed-db-directory "~/Dropbox/shared/elfeeddb"))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files
	(list "~/.emacs.d/feeds.org")))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 2
	company-require-match nil
	company-dabbrev-ignore-case nil
	company-dabbrev-downcase nil)
  :init
  (global-company-mode t))

;; Documentation popups for Company
(use-package company-quickhelp 
  :ensure t
  :config
  (setq company-quickhelp-delay 0.1
	company-tooltip-align-annotations t)
  :init
  (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

(use-package paredit
  :ensure t)

;; Install slime to interact with common-lisp
(use-package slime
  :ensure t
  :init (load (expand-file-name "~/quicklisp/slime-helper.el"))
  :config
  (setq inferior-lisp-program "sbcl"
	slime-contribs '(slime-company slime-fancy slime-repl slime-trace-dialog)
	slime-net-coding-system 'utf-8-unix)
  (add-hook 'slime-load-hook (lambda () (require 'slime-fancy))))

;; Autocomplete backend for common-lisp
(use-package slime-company
  :ensure t
  :defer t)

(defun personal/lisp-mode-hook ()
  (paredit-mode +1)  
  (setq indent-tabs-mode nil))

;; Load personal/lisp-mode-hook in lisp buffers
(add-hook 'lisp-mode-hook 'personal/lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'personal/lisp-mode-hook)

(use-package elisp-mode
  :bind (("C-c C-f" . find-function)
	 ("C-c C-v" . find-variable))
  :hook (emacs-lisp-mode . (lambda ()
			     (paredit-mode t)
			     (eldoc-mode t))))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package tex
  :ensure auctex
  :defer
  :defines TeX-view-program-list TeX-view-program-selection
  :init
  (setq TeX-debug-bad-boxes t
        TeX-parse-self t
        TeX-source-correlate-mode t
        TeX-auto-save t)
  :config
  (setq-default TeX-master nil)
  ;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
  ;; 	TeX-source-correlate-start-server t)
  (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)) 
        TeX-view-program-selection '((output-pdf "PDF Tools"))  
        TeX-source-correlate-start-server t)
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)

  (add-hook 'LaTex-mode-hook 'turn-off-auto-fill)
  )

(use-package reftex
  :ensure t
  :diminish reftex-mode
  :hook (LaTeX-mode . turn-on-reftex)
  :init
  (setq reftex-plug-into-AUCTeX t
        reftex-ref-style-default-list '("Cleveref" "Varioref" "Default")))

(use-package latex-extra
  :ensure t
  :diminish latex-extra-mode
  :hook (LaTeX-mode . latex-extra-mode)
  :config
  (remove-hook 'latex-extra-mode-hook 'latex/setup-auto-fill))

(use-package company-auctex
  :ensure t
  :hook (TeX-mode . company-auctex-init))

(use-package auctex-latexmk
  :ensure t
  :hook (LaTeX-mode . auctex-latexmk-setup)
  :init
  (setq auctex-latexmk-inherit-TeX-PDF-mode t))

;; Org-Bullets
(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package company-bibtex
  :ensure t
  :hook
  (org-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-bibtex)))))

(use-package company-reftex
  :ensure t
  :hook
  (org-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-reftex-labels company-reftex-citations)))))



(use-package epresent
  :ensure t)

;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
;;(global-set-key "\C-cb" 'org-switchb)
