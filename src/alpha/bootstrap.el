;;; bootstrap.el -*- lexical-binding: t; -*-

(defconst system-packages-directory (concat user-emacs-directory
                                            "alpha/system-packages/")
  "Directory containing the installation scripts for system packages.")

(defun alpha/install-straight ()
  (message "Installing straight...")
  (defvar boostrap-version)
  (let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el"
                           user-emacs-directory))
        (bootstrap-version 5))
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp))
    (load bootstrap-file nil 'nomessage))
  (message "Straight sucessfully installed."))

(defun alpha/install-system-packages ()
  (message "Installing system packages...")

  (let ((installation-files (directory-files system-packages-directory
                              nil "^install-.*.el$" nil)))
    (dolist (file installation-files)
      (let ((package-name (substring file 8 (- (length file) 3)))
            (file-full-path (concat system-packages-directory file)))
        (message "Installing system package '%s'..." package-name)
        (load file-full-path nil 'nomessage 'nosuffix)
        (message "Successfully installed system package '%s'." package-name)
        )))

  (message "Finished installing system packages..."))

(message "Starting Alpha Emacs bootstrap...")
(alpha/install-straight)
(alpha/install-system-packages)
(message "Alpha Emacs bootstrap completed.")

;;; bootstrap.el ends here
