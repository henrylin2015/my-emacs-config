;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;加入插件
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar henry/packages '(
	       ;; --- Auto-completion ---
			 company
			 ;;theme
			 monokai-theme
			 ;;删除多余的空格插件
			 hungry-delete
			 ;;swiper & counsel
			 swiper
			 counsel
			 ;;() "" ''....
			 smartparens
			 ;;js2-mode & nodejs
			 js2-mode
			 nodejs-repl
			 ;;exec-path-from-shell
			 exec-path-from-shell
			 
	       ) "Default packages")

(setq package-selected-packages henry/packages)
(defun henry/packages-installed-p ()
    (loop for pkg in henry/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (henry/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg henry/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(package-initialize)

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


;;开启自动补全功能
(global-company-mode t)

;;设置鼠标属性
(setq-default cursor-type 'bar)

;;禁止备份文件
(setq make-backup-files nil)
;;org 语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;配置成对出现的括号，引号等,如(),“”....
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;all of smartparens-mode
(smartparens-global-mode t)

;;选中显示当前的行
(global-hl-line-mode t)

;;加载主题
(load-theme 'monokai t)

;;当空格很多是删除多余的空格
(require 'hungry-delete)
(global-hungry-delete-mode)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;config swiper & counsel 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;config js2-mode for files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;;bind function key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

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
