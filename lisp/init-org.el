;;org 语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(setq org-src-fontify-natively '("~/Documents/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
