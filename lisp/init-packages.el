;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

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
			 ;;popwin
			 popwin
			 
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

;;开启自动补全功能
(global-company-mode t)

;;配置成对出现的括号，引号等,如(),“”....
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;all of smartparens-mode
(smartparens-global-mode t)

;;当空格很多是删除多余的空格
(require 'hungry-delete)
(global-hungry-delete-mode)

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

;;popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
