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

(defun indent-relative-4less (&optional arg)
  "Newline and indent to same indentation as than previous line. With C-u,
indent one level less."
  (interactive "P")
  (let* ((offset (if arg -4 0))
         (indent (save-excursion (back-to-indentation) (current-column))))
    (newline)
    (insert (make-string (+ indent offset) ?\s))))

(global-set-key (kbd "C-j") #'indent-relative-4less)

(defun mn-close-bracket-and-indent ()
  "Reduce indentation and insert a closing bracket."
  (interactive)
  (let ((indent (save-excursion (back-to-indentation) (current-column))))
    (newline)
    (insert (make-string (- indent 4) ?\s))
    (insert "}")))

(global-set-key (kbd "C-c }") #'mn-close-bracket-and-indent)

(defun mn-add-braces ()
  "Fancy insert {} and indent."
  (interactive)
  (let ((indent (save-excursion (back-to-indentation) (current-column))))
    (insert "{")
    (newline)
    (insert (make-string (+ indent 4) ?\s))
    (newline)
    (insert (make-string indent ?\s))
    (insert "}")
    (move-end-of-line 0)))

(global-set-key (kbd "C-c {") #'mn-add-braces)

(defun mn-eval-swift-buffer ()
  (interactive)
  (save-buffer)
  (shell-command (concat "swift " (buffer-file-name (current-buffer)))))

(global-set-key (kbd "C-c v") #'mn-eval-swift-buffer)

(defun pbcopy ()
    (interactive)
    (shell-command-on-region (mark) (point) "pbcopy"))

(global-set-key (kbd "C-M-v") 'pbcopy)

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
