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
;; (setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 200 4))
(setq-default indent-line-function 'tab-to-tab-stop)

(electric-pair-mode 1)

(defun pbcopy ()
    (interactive)
    (shell-command-on-region (mark) (point) "pbcopy"))

(global-set-key (kbd "C-M-v") 'pbcopy)

(defun mn-eval-swift-buffer ()
  (interactive)
  (save-buffer)
  (shell-command (concat "swift " (buffer-file-name (current-buffer)))))

;; (global-set-key (kbd "C-c v") #'mn-eval-swift-buffer)

(defun mn-eval-go-buffer ()
  (interactive)
  (save-buffer)
  (shell-command "go run ."))

(add-hook
 'go-mode-hook
 (lambda () (define-key go-mode-map (kbd "C-c v") #'mn-eval-go-buffer)))

(add-hook 'before-save-hook #'gofmt-before-save)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; Electric indent mode causes unwanted behaviour when writing commit
;; messages in Fundamental mode (the default), so switch to text mode.
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . text-mode))

;; With Emacs 27, electric-indent seems to have been turned on for
;; text-mode too, disable it to prevent newline from indenting after
;; we type the commit message title.
(add-hook 'text-mode-hook (lambda () (electric-indent-local-mode -1)))

;; M-x package-install multiple-cursors
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)

(global-set-key (kbd "C-c C-a") 'mc/edit-lines)
(global-set-key (kbd "C-c C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-m") 'mc/mark-all-like-this)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (multiple-cursors go-mode)))
 '(sort-fold-case t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
