
;; IDO
(defvar *my-ido-active* nil)
(when *my-ido-active*
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))

