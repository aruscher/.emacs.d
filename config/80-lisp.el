;; SLIME company goodness

(use-package slime-company
  :ensure t
  :defer t)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"
	slime-contribs '(slime-company slime-fancy)
	slime-net-coding-system 'utf-8-unix))

(use-package lispy
  :ensure t
  :config
  (add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1))))

