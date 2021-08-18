;;; alpha.el -*- lexical-binding: t; -*-

(defconst alpha/straight-bootstrap-file
  (concat user-emacs-directory
          "straight/repos/straight.el/bootstrap.el")
  "Straight.el file path.")

(defconst alpha/alpha-emacs-directory
  (concat user-emacs-directory "alpha/")
  "Alpha Emacs directory.")

(defconst alpha/management-directory
  (concat alpha/alpha-emacs-directory "management/")
  "Directory containing the Alpha Emacs management scripts.")

(defconst alpha/operation-directory
  (concat alpha/alpha-emacs-directory "operation/")
  "Directory containing the Alpha Emacs operation scripts.")

(defconst alpha/system-packages-directory
  (concat alpha/alpha-emacs-directory "system-packages/")
  "Directory containing the installation scripts for system packages.")

(defun alpha/load (filepath)
  "Load FILEPATH under Alpha Emacs directory."
  (load (concat alpha/alpha-emacs-directory filepath)
        nil 'nomessage 'nosuffix))

(defun alpha/load-management-files ()
  "Load files necessary for Alpha Emacs management."
  (alpha/load (concat alpha/management-directory "packages.el")))

(defun alpha/load-operation-files ()
  "Load files necessary for Alpha Emacs operation.."
  (alpha/load (concat alpha/operation-directory "packages.el"))
  (alpha/load (concat alpha/operation-directory "initialize.el")))

;;; alpha.el ends here
