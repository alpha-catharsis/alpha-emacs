;;; update.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)
(alpha/load-operation-files)

;; Loading staight
(alpha/load-straight)

;; Loading system packages
(alpha/load-system-packages)

;; Updateing Alpha Emacs
(message "Updating installed packages...")
(straight-pull-all)
(straight-check-all)
(message "Installed packages updated.")

;;; update.el ends here
