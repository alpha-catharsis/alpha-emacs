;;; rebuild.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)
(alpha/load-operation-files)

;; Loading staight
(alpha/load-straight)

;; Loading system packages
(alpha/load-system-packages)

;; Updateing Alpha Emacs
(message "Rebuilding installed packages...")
(straight-rebuild-all)
(message "Installed packages rebuilt.")

;;; rebuild.el ends here
