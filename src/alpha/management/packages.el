;;; package.el -*- lexical-binding: t; -*-

;; Straight installation
(defun alpha/install-straight ()
  "Install straight.el."
  (message "Installing straight...")
  (defvar boostrap-version)
  (let ((bootstrap-version 5))
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp))
    (load alpha/straight-bootstrap-file nil 'nomessage))
  (message "Straight sucessfully installed."))

;; System packages installation
(defun alpha/install-system-packages ()
  "Install system packages."
  (message "Installing system packages...")

  (let ((installation-files (directory-files alpha/system-packages-directory
                                             nil "^install-.*.el$" nil)))
    (dolist (file installation-files)
      (let ((package-name (substring file 8 (- (length file) 3)))
            (file-full-path (concat alpha/system-packages-directory file)))
        (message "Installing system package '%s'..." package-name)
        (load file-full-path nil 'nomessage 'nosuffix)
        (message "Successfully installed system package '%s'." package-name)
        )))

  (message "Finished installing system packages."))

;;; package.el ends here
