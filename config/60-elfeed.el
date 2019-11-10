(use-package elfeed
  :ensure t)

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files
	(list "~/.emacs.d/feeds.org")))

(use-package lang-detect
  :load-path "dev/lang-detect")

(use-package elfeed-lang
  :after lang-detect
  :load-path "dev/elfeed-lang")


(use-package try
  :ensure t)
