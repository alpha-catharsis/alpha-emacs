;;; load-ivy.el -*- lexical-binding: t; -*-

(use-package ivy
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers nil))

(use-package swiper
  :bind (("C-c s s" . swiper)))

(use-package ivy-avy
  :bind (("C-c n s" . ivy-avy)))

(use-package counsel)

;;; load-ivy.el ends here
