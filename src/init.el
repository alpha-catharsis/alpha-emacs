;;; init.el -*- lexical-binding: t; -*-

(defconst system-packages-directory (concat user-emacs-directory
                                            "alpha/system-packages/")
  "Directory containing the installation scripts for system packages.")

(defun alpha/pre-configure ()
  (load (concat user-emacs-directory "pre-config.el") nil t t))

(defun alpha/load-system-packages ()
  (let ((load-files (directory-files system-packages-directory
                                             nil "^load-.*.el$" nil)))
    (dolist (file load-files)
      (let ((package-name (substring file 5 (- (length file) 3)))
            (file-full-path (concat system-packages-directory file)))
        (load file-full-path nil 'nomessage 'nosuffix))))
  )

(defun alpha/post-configure ()
  (load (concat user-emacs-directory "post-config.el") nil t t))

;; Configuration before loading any system package
(alpha/pre-configure)

;; Loading system packages
(alpha/load-system-packages)

;; Configuration after loading system packages
(alpha/post-configure)

;;; init.el ends here
