;;; alpha-conf.el -*- lexical-binding: t; -*-

;; Tasks/Task Groups/Global
;;   Capabilities
;;     Options

;; pre-configuration
;; package loading (init/configure/bindings)
;; post-configuration

(alpha/add-grouped-task programming
                        :tasks
                        c-programming
                        c++-programming
                        haskell-programmming
                        python-programming)

(alpha/add-task text-editing)

;;; alpha-conf.el ends here
