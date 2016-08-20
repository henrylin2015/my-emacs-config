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



(provide 'init-better-defaults)
