(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require-package 'evil)
(require-package 'evil-leader)

(require-package 'color-theme-solarized)


(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(setq evil-leader/in-all-states 1)

(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)
