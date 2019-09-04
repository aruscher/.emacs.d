;; SLIME company goodness

(use-package slime-company
  :defer t)


(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"
	slime-contribs '(slime-company slime-fancy)
	slime-net-coding-system 'utf-8-unix))
