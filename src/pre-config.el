;;; pre-config.el -*- lexical-binding: t; -*-

;; Loadign staight
(defconst bootstrap-version 5)
(load (expand-file-name "straight/repos/straight.el/bootstrap.el"
                        user-emacs-directory) nil 'nomessage 'nosuffix)

;; Enabling straight integration with use-package
(straight-use-package 'use-package)
(setq straight-enable-use-package-integration t)

;;; pre-config.el ends here
