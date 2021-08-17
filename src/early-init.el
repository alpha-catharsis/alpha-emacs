;;; early-init.el -*- lexical-binding: t; -*-

;; Temporarily disable GC
(setq gc-cons-threshold most-positive-fixnum)

;; Disable runtime compilation
(setq comp-deferred-compilation nil)
(setq native-comp-deferred-compilation nil)

;; Disable package.el
(setq package-enable-at-startup nil)

;;; early-init.el ends here
