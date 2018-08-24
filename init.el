(setq visible-bell 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode 1)
(setq show-paren-style 'mixed)

(global-linum-mode 1)
(global-hl-line-mode +1)

(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(defun open-config-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;; Standard package repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key "ev" 'open-config-file)
    )
  )


(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark))
