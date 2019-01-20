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

(defun indent-relative-4less (&optional arg)
  "Newline and indent 4 spaces less than previous line. With C-u,
indent to same level as previous line."
  (interactive "P")
  (let* ((offset (if arg 0 -4))
         (indent (save-excursion (back-to-indentation) (current-column))))
    (newline)
    (insert (make-string (+ indent offset) ?\s))))

(global-set-key (kbd "C-j") #'indent-relative-4less)

(defun pbcopy ()
    (interactive)
    (shell-command-on-region (mark) (point) "pbcopy"))
(global-set-key (kbd "C-M-v") 'pbcopy)

(custom-set-variables
 '(sort-fold-case t))
