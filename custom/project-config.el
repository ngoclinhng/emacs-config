;;; project-config.el --- Project Management and Git Integration
;;
;; Author: lynhngoc88@gmail.com
;;

;;; Commentary:
;;
;; This file contains configuration settings for project management and
;; Git integration using Projectile and Magit.

;;; Code:

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(provide 'project-config)

;;; project-config.el ends here
