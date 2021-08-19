;;; bootstrap.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)
(alpha/load-bootstrap-files)

;; Initialize Alpha Emacs
(alpha/install-straight)
(alpha/install-system-packages)

;;; bootstrap.el ends here
