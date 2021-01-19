;;; init.el --- My emacs configuration -*- lexical-binding: t -*-

;;; Commentary:

;; The actual configuration is in `config.org'.
;; This file just loads it if not compiled.

;;; Code:
(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

(provide 'init)

;;; init.el ends here


