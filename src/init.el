;;; init.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)

;; Initialize Alpha Emacs
(alpha/load-operation-files)
(alpha/load-straight)
(alpha/alpha-initialize)

;;; init.el ends here
