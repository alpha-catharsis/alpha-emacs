;;; initialize.el -*- lexical-binding: t; -*-

(defun alpha/alpha-initialize ()
  "Initialize Alpha Emacs."

  ;; Configuration before loading any system package
  (alpha/load (concat alpha/operation-directory
                      "pre-config.el"))

  ;; Loading system packages
  (alpha/load-system-packages)

  ;; Configuration after loading system packages
  (alpha/load (concat alpha/operation-directory
                      "post-config.el")))

;;; initialize.el ends here
