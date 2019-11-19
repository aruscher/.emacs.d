(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (add-to-list 'auto-mode-alist (cons "\\.pdf$" 'pdf-view-mode))
  
  )
