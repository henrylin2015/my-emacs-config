;;load file
(global-auto-revert-mode t)



;;选中删除
(delete-selection-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;ji qiao
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("lhl" "henry")
					    ;;;page
					    ("page" "henry/packages")
					    ))

;;代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


(provide 'init-better-defaults)
