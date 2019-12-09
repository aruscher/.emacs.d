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


