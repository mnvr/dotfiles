(when (>= emacs-major-version 24)
  ;; Added by Package.el.  This must come before configurations of
  ;; installed packages.  Don't delete this line.  If you don't want it,
  ;; just comment it out by adding a semicolon to the start of the line.
  ;; You may delete these explanatory comments.
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq make-backup-files nil)
(global-font-lock-mode 0)
(menu-bar-mode 0)
(setq ring-bell-function 'ignore)

(setq-default require-final-newline t)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 200 4))
(setq-default indent-line-function 'tab-to-tab-stop)

;; It inserts a indent of 4-spaces e.g. in COMMIT_EDITMSG when I press RET
;; Disable it
(electric-indent-mode 0)

(defun pbcopy ()
    (interactive)
    (shell-command-on-region (mark) (point) "pbcopy"))

(global-set-key (kbd "C-M-v") 'pbcopy)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sort-fold-case t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
