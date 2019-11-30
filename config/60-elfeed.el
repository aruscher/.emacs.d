(defun bjm/elfeed-load-db-and-open ()
    (interactive)
    (elfeed-db-load)
    (elfeed)
    (elfeed-search-update--force))

(defun bjm/elfeed-save-db-and-bury ()
  (interactive)
  (elfeed-db-save)
  (quit-window))

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
	      ("q" . bjm/elfeed-save-db-and-bury)
	      ("Q" . bjm/elfeed-save-db-and-bury))
  :config
  (setq elfeed-db-directory "~/Dropbox/shared/elfeeddb"))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files
	(list "~/.emacs.d/feeds.org")))
