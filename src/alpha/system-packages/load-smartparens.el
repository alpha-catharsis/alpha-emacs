;;; load-smartparens.el -*- lexical-binding: t; -*-

(use-package smartparens
  :config
  (require 'smartparens-config)
  (setq sp-pairs nil)
  (sp-pair "(" ")" :unless '(sp-point-before-symbol-p
                             sp-point-before-word-p
                             sp-point-before-same-p))
  (sp-pair "[" "]" :unless '(sp-point-before-symbol-p
                             sp-point-before-word-p
                             sp-point-before-same-p))
  (sp-pair "{" "}" :unless '(sp-point-before-symbol-p
                             sp-point-before-word-p
                             sp-point-before-same-p))
  (sp-pair "'" "'" :unless '(sp-point-before-symbol-p
                             sp-point-before-word-p
                             sp-point-before-same-p))
  (sp-pair "\"" "\"" :unless '(sp-point-before-symbol-p
                               sp-point-before-word-p
                               sp-point-before-same-p))
  (sp-pair "`'" "`'" :unless '(sp-point-before-symbol-p
                               sp-point-before-word-p
                               sp-point-before-same-p))
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  (setq sp-max-prefix-length 100)
  (setq sp-max-pair-length 1)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

;;; load-smartparens.el ends here
