;;; bootstrap.el -*- lexical-binding: t; -*-

;; Loading alpha emacs init file
(load (concat user-emacs-directory "alpha.el") nil 'nomessage 'nosuffix)
(alpha/load-bootstrap-files)

;; Initialize Alpha Emacs
;; (alpha/install-straight)
;; (alpha/install-system-packages)

(require 'subr-x)

(alpha/load-user-configuration-file)
(print (hash-table-keys alpha/tasks))
(print (gethash "programming" alpha/tasks))
(print (gethash "python-programming" alpha/tasks))
(print (gethash "text-editing" alpha/tasks))
;;; bootstrap.el ends here
