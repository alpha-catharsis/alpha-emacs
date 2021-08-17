;;; pre-config.el -*- lexical-binding: t; -*-

;; Loadign staight
(defconst bootstrap-version 5)
(load (expand-file-name "straight/repos/straight.el/bootstrap.el"
                        user-emacs-directory) nil 'nomessage 'nosuffix)

;; Enabling straight integration with use-package
(straight-use-package 'use-package)
(setq straight-enable-use-package-integration t)
(setq straight-use-package-by-default t)

;; Setting UTF-8 as default coding system
(set-language-environment "UTF-8")

;; Disable warnings on legacy advice system
(setq ad-redefinition-action 'accept)

;; Cleanup initial messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message user-login-name)
(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))
(setq inhibit-default-init t)
(setq initial-buffer-choice (lambda () (get-buffer "*Messages*")))
(setq initial-scratch-message nil)

;; Disable automatic case folding
(setq auto-mode-case-fold nil)

;; Diable bidirectional text scanning
(setq-default bidi-display-reordering 'left-to-right)
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Cursor configuration
(setq-default cursor-in-non-selected-windows nil)
(setq visible-cursor nil)
(blink-cursor-mode 0)

;; Highlighting configuration
(setq highlight-nonselected-windows nil)

;; Improving scrolling preformance
(setq fast-but-imprecise-scrolling t)
(setq redisplay-skip-fontification-on-input t)

;; Inhibit impllicit frame resize
(setq frame-inhibit-implied-resize t)

;; Inhibit compacting font caches
(setq inhibit-compacting-font-caches t)

;; Increasing read process maximum size
(setq read-process-output-max (* 16 1024 1024))

;; Disabling most UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enabling visible bell
(setq visible-bell t)

;; Disabling backup files, autosave and lockfiles
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Tabs/indentation configuration
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default tab-always-indent nil)
(setq tabify-regexp "^\t* [ \t]+")

;; Columns configurations
(setq-default fill-column 80)
(setq-default word-wrap t)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Sentence end handling
(setq sentence-end-double-space nil)

;; Final newline handling
(setq require-final-newline t)

;; Clipboard configuration
(setq kill-do-not-save-duplicates t)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Configure programming modes
(setq display-line-numbers-width-start 3)
(setq display-fill-column-indicator-character "│")
(add-hook 'prog-mode-hook
          #'(lambda ()
              (display-line-numbers-mode)
              (display-fill-column-indicator-mode)
              (column-number-mode)))

;;; pre-config.el ends here
