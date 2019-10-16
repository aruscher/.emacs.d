;; Company Auto-Complete
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 2
	company-require-match nil
	company-dabbrev-ignore-case nil
	company-dabbrev-downcase nil)
  :init
  (global-company-mode t))


(use-package company-quickhelp          ; Documentation popups for Company
  :ensure t
  :config
  (setq company-quickhelp-delay 0.2
	company-tooltip-align-annotations t)
  :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

