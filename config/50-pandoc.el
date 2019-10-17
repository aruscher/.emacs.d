(use-package pandoc-mode
  :ensure t
  :commands (pandoc-mode pandoc-load-default-settings)
  :init
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings))









