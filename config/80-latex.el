(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  ;; Misc Config
  (setq-default TeX-master nil)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
	    #'TeX-revert-document-buffer)
  
  ;; to use pdfview with auctex
  (add-hook 'LaTeX-mode-hook 'pdf-tools-install)


  (setq TeX-PDF-mode t)
  
  ;; to use pdfview with auctex
  (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
	TeX-source-correlate-start-server t)
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))



(use-package company-auctex
  :ensure t
  :hook
  (latex-mode . (company-auctex-init)))

(use-package company-bibtex
  :ensure t
  :hook
  (latex-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-bibtex)))))

(use-package company-reftex
  :ensure t
  :hook
  (latex-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-reftex-labels company-reftex-citations)))))
