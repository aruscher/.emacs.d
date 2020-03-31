(use-package multiple-cursors
  :ensure t
  :config
  (setq mc/always-run-for-all t)
  :bind
  (("C-c ]" . mc/mark-next-like-this)
   ("C-c C-]" . mc/mark-next-like-this)
   ("C-c l" . mc/edit-lines)))
