;;; package.el -*- lexical-binding: t; -*-

;; Straight loading
(defun alpha/load-straight ()
  "Load straight.el."
  (load alpha/straight-bootstrap-file nil 'nomessage 'nosuffix)
  ;; Enabling straight integration with use-package
  (straight-use-package 'use-package)
  (setq straight-enable-use-package-integration t)
  (setq straight-use-package-by-default t))

;; System packages loading
(defun alpha/load-system-packages ()
  "Load system packages."
  (let ((load-files (directory-files alpha/system-packages-directory
                                     nil "^load-.*.el$" nil)))
    (dolist (file load-files)
      (let ((package-name (substring file 5 (- (length file) 3)))
            (file-full-path (concat alpha/system-packages-directory file)))
        (load file-full-path nil 'nomessage 'nosuffix)))))

;;; package.el ends here
