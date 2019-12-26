;; SLIME company goodness

(use-package slime-company
  :ensure t
  :defer t)

(use-package slime
  :ensure t
  :init (load (expand-file-name "~/quicklisp/slime-helper.el"))
  :config
  (setq inferior-lisp-program "sbcl"
	slime-contribs '(slime-company slime-fancy slime-repl slime-trace-dialog)
	slime-net-coding-system 'utf-8-unix)
  (add-hook 'slime-load-hook (lambda () (require 'slime-fancy)))
  (add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
  (add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-hook))


(defun my-lisp-mode-hook ()
  (paredit-mode +1)  
  (setq indent-tabs-mode nil))
