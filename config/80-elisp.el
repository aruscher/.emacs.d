(use-package elisp-mode
  :bind (("C-c C-f" . find-function)
         ("C-c C-v" . find-variable))
  :hook (emacs-lisp-mode . (lambda ()
			     (paredit-mode t)
			     (eldoc-mode t))))
