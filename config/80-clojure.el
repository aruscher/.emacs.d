(use-package cider-eval-sexp-fu
  :defer t)

(use-package clj-refactor
  :defer t
  :ensure t
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))


(use-package cider
  :ensure t
  :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :config (setf cider-lein-command "~/bin/lein")
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))


(use-package clojure-mode
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'eldoc-mode)
  (add-hook 'clojure-mode #'paredit-mode))
