(use-package helm
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files))
  :config
  (setq helm-mode-fuzzy-match t)
  (helm-mode 1))


(use-package helm-projectile
  :config
  (helm-projectile-on))
