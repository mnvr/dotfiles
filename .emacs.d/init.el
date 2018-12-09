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

(defun pbcopy ()
    (interactive)
    (shell-command-on-region (mark) (point) "pbcopy"))
(global-set-key (kbd "C-M-v") 'pbcopy)

(custom-set-variables
 '(sort-fold-case t))
