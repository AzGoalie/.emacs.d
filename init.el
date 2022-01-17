;; Bootstrap straight.els
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Configure default emacs
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      indent-tabs-mode nil
      tab-width 4
      save-interprogram-paste-before-kill t
      confirm-nonexistent-file-or-buffer nil)

(fset 'yes-or-no-p 'y-or-n-p)

(global-display-line-numbers-mode t)

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; Needed for use-package
(use-package diminish)
(use-package bind-key)

;; Stop polluting every directory
(use-package no-littering
  :custom
  (auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (custom-file (no-littering-expand-etc-file-name "custom.el")))

;; Theme
(use-package modus-themes
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mode-line '(moody accented borderless))
  (x-underline-at-descent-line t)
  :config
  (modus-themes-load-themes)
  (modus-themes-load-vivendi))

;; Modeline
(use-package moody
  :config
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(use-package which-key
  :diminish
  :config
  (which-key-mode t))

;; Completion framework
(use-package selectrum
  :config
  (selectrum-mode t))

;; Better sorting for completions
(use-package prescient
  :custom
  (prescient-history-length 1000)
  :config
  (prescient-persist-mode t))

(use-package selectrum-prescient
  :after
  selectrum
  :config
  (selectrum-prescient-mode t))

;; Useful docs in the minibuffer
(use-package marginalia
  :config
  (marginalia-mode t))

;; Better help
(use-package helpful
  :bind
  (([remap describe-function] . #'helpful-callable)
   ([remap describe-variable] . #'helpful-variable)
   ([remap describe-symbol]   . #'helpful-symbol)
   ([remap describe-key]      . #'helpful-key)))

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package company
  :config
  (global-company-mode t))

(use-package project
  :bind-keymap
  ("C-x p" . project-prefix-map))

(load custom-file 'noerror 'nomessage)
