(require 'dash)

(defvar *lang-detect-folder* (file-name-directory (find-library-name "lang-detect")))
(defvar *lang-detect-trigrams-folder* (expand-file-name "trigrams" *lang-detect-folder*))

(defun lang-detect--extract-supported-languages ()
  (mapcar #'make-symbol
	  (directory-files *lang-detect-trigrams-folder* nil "^[[:lower:]]")))

(defvar *lang-detect-supported-language-symbols* (lang-detect--extract-supported-languages))

(defun lang-detect--get-lang-file (lang-symbol)
  (expand-file-name (symbol-name lang-symbol) *elfeed-lang-trigrams-folder*))

(defun elfeed-lang--build-regexes (language-symbols)
  (dolist (language-symbol language-symbols)
    (push (list language-symbol ))))

(defun elfeed-lang--build-regex (language-symbol)
  (let ((file (elfeed-lang--get-lang-file language-symbol)))
    (string-join
     (with-temp-buffer
       (insert-file-contents file)
       (split-string (buffer-string) "\n" t))
     "\\|")))




(provide 'lang-detect)
