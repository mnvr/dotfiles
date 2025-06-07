(menu-bar-mode 0)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

;; Use spaces instead of tabs when indenting
(setq-default indent-tabs-mode nil)

;; Disable vc and the message about following symbolic links
(setq vc-handled-backends nil)

;; Wrap at 80 characters (instead of the default 72).
(setq-default fill-column 80)

;; M-x sh to open a shell window below
(defun sh ()
  (interactive)
  (let ((w (split-window-below -8)))
    (select-window w)
    (shell)))
