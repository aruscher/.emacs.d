(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package use-package-ensure-system-package
  :ensure t)

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
	 auto-package-update-prompt-before-update t
         auto-package-update-interval 7)
   (auto-package-update-maybe))
