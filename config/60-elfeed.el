(use-package elfeed
  :ensure t)

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files
	(list "~/.emacs.d/feeds.org")))
