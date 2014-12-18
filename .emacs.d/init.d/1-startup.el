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


(setq tab-width 2
            indent-tabs-mode nil)
(electric-indent-mode t)


(setq make-backup-files nil)


(defalias 'yes-or-no-p 'y-or-n-p)


(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)


(setq echo-keystrokes 0.1
            use-dialog-box nil
                  visible-bell t)
(show-paren-mode t)


(if window-system
    (load-theme 'wombat t)
  (load-theme 'wombat t))


(require 'flx-ido)
(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-user-faces nil)

(require 'yasnippet)
(yas-global-mode 1)


(require 'auto-complete-config)


(require 'smartparens-config)

(require 'magit)
(projectile-global-mode t)
