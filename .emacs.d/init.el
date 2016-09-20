(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(eval-when-compile (package-initialize))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(when (not (and (eq system-type 'darwin) window-system))
  (menu-bar-mode -1))
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (setq initial-frame-alist '((width . 102) (height . 53))))
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))
(electric-indent-mode t)
(show-paren-mode t)
(load-theme 'wombat t)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(set-fontset-font "fontset-default"
		  'han '("PingFang SC" . "unicode-bmp"))

(eval-when-compile
  (setq use-package-always-ensure t)
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Interface Enhancement
(use-package swiper
  :config
  (ivy-mode)
  :bind
  (("C-s" . swiper)))
(use-package neotree)
;; Visual
(use-package linum-relative
  :config
  (linum-mode 1))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Editing
(use-package expand-region
  :bind ("C-=" . er/expand-region))
(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-lines)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

(use-package projectile
  :diminish projectile-mode
  :config
  (progn
    (projectile-global-mode t)
    (setq projectile-completion-system 'ido)
    (setq projectile-switch-project-action 'projectile-dired)
    ))
;; Programming
(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (yas-global-mode 1))
(use-package smartparens
  :diminish smartparens-mode
  :init
  (require 'smartparens-config)
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))
(use-package company
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(use-package ggtags
  :config
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index))
;; Programming Language
(use-package web-mode
  :mode ("\\.hbs\\'" . web-mode))
(use-package skewer-mode)
(use-package js2-mode
  :mode (("\\.js$" . js2-mode)
         ("\\.json$" . js2-mode))
  :config
  (progn
    (setq js-indent-level 2
          js2-indent-level 2
          js2-basic-offset 2)))
(use-package json-reformat)
(use-package php-mode
  :config
  (use-package drupal-mode))
(use-package swift-mode)


(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package magit
  :bind ("C-x g" . magit-status))
(when (memq window-system '(mac ns))
      (use-package exec-path-from-shell
          :config (exec-path-from-shell-initialize)))
(use-package markdown-mode
  :config
  (progn
    (setq markdown-command "pandoc -f markdown_github")))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (swiper php-refactor-mode ggtags linum-relative company which-key rainbow-delimiters yaml-mode yagist web-mode use-package swift-mode smartparens smart-mode-line skewer-mode shell-pop projectile popwin php-auto-yasnippets neotree multiple-cursors markdown-mode magit less-css-mode json-reformat git-gutter geben flx-ido expand-region exec-path-from-shell drupal-mode dockerfile-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
