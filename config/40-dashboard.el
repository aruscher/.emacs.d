(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner nil)
  (setq dashboard-items
	'((recents . 5)
	  (projects .5)))
  (dashboard-setup-startup-hook))
