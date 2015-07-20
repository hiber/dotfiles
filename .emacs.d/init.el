(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
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
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))
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
  (require 'use-package))

(use-package exec-path-from-shell
  :ensure t
  :demand exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package popwin
  :ensure t
  :init ())

(use-package flx-ido
  :ensure t
  :config
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)))
(use-package smartparens
  :ensure t
  :init
  (progn
    (require 'smartparens-config)
    (setq sp-autoescape-string-quote nil)
    (setq-default sp-autoskip-closing-pair 'always)
    (smartparens-global-mode t)
    (show-smartparens-global-mode t)))

(use-package expand-region
  :ensure expand-region
  :bind ("C-=" . er/expand-region))
(use-package multiple-cursors
  :ensure multiple-cursors
  :bind (("C->" . mc/mark-next-lines)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

(use-package auto-complete-config
  :ensure auto-complete
  :init
  (progn
    (ac-config-default)))
(use-package company
  :disabled t
  :ensure t
  :diminish company-mode
  :init (global-company-mode))
(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode t))
(use-package magit
  :ensure magit
  :bind ("C-x g" . magit-status)
  :config
  (progn
    (setq magit-last-seen-setup-instructions "1.4.0"))
  )
(use-package yagist :ensure t)
(use-package projectile
  :ensure projectile
  :diminish projectile-mode
  :config
  (progn
    (projectile-global-mode t)
    (setq projectile-completion-system 'ido)
    (setq projectile-switch-project-action 'projectile-dired)
    ))

(use-package helm
  :disabled t
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (helm-mode 1)
    )
  :config
  (progn
    (require 'helm-files)
    (eval-after-load 'projectile
      (use-package helm-projectile
	:ensure helm-projectile
	:config
	(progn
	  (helm-projectile-on))))
    (use-package helm-swoop)
    (use-package helm-spotify)
    )
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ))

(use-package dash-at-point :ensure t)

(use-package shell-pop
  :ensure t
  :init
  (progn
    (setq system-uses-terminfo nil)
    (setq shell-pop-term-shell "/bin/zsh")
    (setq shell-pop-shell-type '("ansi-term"
				 "*ansi-term*"
				 (lambda
				   nil (ansi-term shell-pop-term-shell)))))
  :bind(("C-t" . shell-pop)))

(use-package yasnippet
  :ensure yasnippet
  :init
  (progn
    (yas-global-mode t)))

(use-package neotree :ensure t)
(use-package smart-mode-line
  :ensure t
  :config (progn
	    (setq sml/no-confirm-load-theme t)
	    (sml/setup)))

(use-package geben
  :ensure t
  :commands (geben
             geben-mode))

(use-package php-mode
  :ensure php-mode
  :config
  (progn
    (use-package php-auto-yasnippets
      :ensure php-auto-yasnippets
      :config
      (progn
	(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")
	(payas/ac-setup))
      :bind (("C-c C-y" . yas/create-php-snippet)))
    (use-package drupal-mode :ensure t)
    (add-hook 'php-mode-hook
	      (lambda () (interactive) (setq-local helm-dash-docsets '("PHP"))))
    (add-hook 'php-mode-hook 'imenu-add-menubar-index)
    (setq imenu-auto-rescan t)))
(use-package skewer-mode :ensure t)
(use-package web-mode
  :ensure t
  :mode ("\\.hbs\\'" . web-mode))
(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode)
         ("\\.json$" . js2-mode))
  :config
  (progn
    (setq js-indent-level 2
          js2-indent-level 2
          js2-basic-offset 2)))
(use-package json-reformat :ensure t)
(use-package yaml-mode :ensure t)
(use-package markdown-mode
  :ensure t
  :config
  (progn
    (setq markdown-command "pandoc -f markdown_github")))
(use-package less-css-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package swift-mode
  :ensure t
  :mode "\\.swift$")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
