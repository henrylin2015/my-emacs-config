;;org 语法高亮
(with-eval-after-load 'org
  ;; Org 模式相关设定
  (setq org-src-fontify-natively t)
  (setq org-src-fontify-natively '("~/Documents/org"))
  ;;org
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Documents/org/gtd.org" "工作安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))
  )

(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
