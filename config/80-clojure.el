(use-package cider
  :ensure t
  :config (setf cider-lein-command "~/bin/lein")
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

