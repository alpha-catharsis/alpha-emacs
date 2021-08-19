;;; install.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)

;; Initialize Alpha Emacs
(message "Starting Alpha Emacs bootstrap...")
(alpha/perform-bootstrap)
(message "Alpha Emacs bootstrap completed.")

;;; install.el ends here
