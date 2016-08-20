;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
;;关闭工具栏
(tool-bar-mode -1)
;;关闭右边滑动杆
(scroll-bar-mode -1)
;;关闭启动画面
(setq inhibit-splash-screen t)
;;启动行号
(global-linum-mode t)
;;缩进
;;(electric-indent-mode t)

;;load file
(global-auto-revert-mode t)


;;setting language utf-8
(set-language-environment "utf-8")
;;选中删除
(delete-selection-mode t)



;;设置鼠标属性
(setq-default cursor-type 'bar)

;;禁止备份文件
(setq make-backup-files nil)
;;org 语法高亮
(require 'org)
(setq org-src-fontify-natively t)


;;选中显示当前的行
(global-hl-line-mode t)

;;加载主题
(load-theme 'monokai t)



(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)



;;bind function key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;ji qiao
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("lhl" "henry")
					    ;;;page
					    ("page" "henry/packages")
					    ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray"))))
 )
