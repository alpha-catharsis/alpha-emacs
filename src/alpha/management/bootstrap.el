;;; bootstrap.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)
(alpha/load-management-files)

;; Initialize Alpha Emacs
(message "Starting Alpha Emacs bootstrap...")
(alpha/install-straight)
(alpha/install-system-packages)
(message "Alpha Emacs bootstrap completed.")

;;; bootstrap.el ends here
