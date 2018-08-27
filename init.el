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

  (setq evil-shift-width 2)

  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key "ev" 'open-config-file)
  )
)


(use-package neotree
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "I") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "z") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "m") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)
  (evil-define-key 'normal neotree-mode-map (kbd "S") 'neotree-enter-horizontal-split)
)


(use-package cmake-mode
  :ensure t
  :config
  (setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))
)


(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark))
