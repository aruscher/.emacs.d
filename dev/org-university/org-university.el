
(defgroup org-university
  nil
  "")

(defcustom org-university-directories
  nil
  ""
  :type '(repeat (group symbol string))
  :group 'org-university)


(message "%s" org-university-directories)

(defun org-university-make-directory (directory)
  (interactive "DDirectory:"))
