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
			 ;;web-mode
			 web-mode
			 ;;js2-refactor
			 js2-refactor
			 ;;expand-region
			 expand-region
			 ;;iedit
			 iedit
			 ;;org-pomodoro
			 org-pomodoro
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
;;(require 'smartparens-config)
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;;;start web-mode
;;首先是缩减的大小的设置。因为 web-mode 支持在 HTML 文件中存在多语言，所以我们可以对不同的语言的缩减做出设置。下面的代码用于设置初始的代码缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;;下面的函数可以用于在两个空格和四个空格之间进行切换，
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;;;end web-mode


;;config for js2-refactor 在安装完成后，添加一个钩子（Hook）
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
;;下面的代码用于配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串：
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)



;;popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
