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


;;config js2-mode for files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.php$" . php-mode)
	 ;;markdown
	 ;;("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
	 )
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
;;Highlight current HTML element
(setq web-mode-enable-current-element-highlight t)
;;You can also highlight the current column with
(setq web-mode-enable-current-column-highlight t)
;;;end web-mode


;;config for js2-refactor 在安装完成后，添加一个钩子（Hook）
(add-hook 'js2-mode-hook #'js2-refactor-mode)
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



;;popwin
(require 'popwin)
(popwin-mode 1)

;;config flycheck
;;(global-flycheck-mode t)

;;语法检查，这个设置只是在js2-mode下语法才会检查的
(add-hook 'js2-mode-hook 'flycheck-mode)
;;web-mode
(add-hook 'web-mode-hook 'flycheck-mode)
;;php-mode
;;(add-hook 'php-mode-hook 'flycheck-mode)
;;(add-hook 'php-mode-hook 'yas-reload-all)
;;python-mode
(add-hook 'python-mode-hook 'flycheck-mode)
;;c/c++
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook #'company-mode)
;;yasnippet
(require 'yasnippet)
(setq yas/prompt-functions
   '(yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
(yas/global-mode t)
(yas/minor-mode-on) ;;以minor mode打开，这样才能配合主mode使用
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(ac-config-default)

;;Evil 模式
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;evil-leader
(global-evil-leader-mode)

;;Window-numbering
(window-numbering-mode 1)
;;Evil-nerd-commenter
(require 'evil-surround)
(global-evil-surround-mode)
(evilnc-default-hotkeys)
;;which-key
(which-key-mode 1)

;;config for php mode flymake 
(eval-after-load 'php-mode
  '(require 'php-ext))
(add-hook 'php-mode-hook 'flymake-php-load)

;;python config
(elpy-enable)
;;c/c++
(add-to-list 'company-backends 'company-c-headers)
(defun ede-object-system-include-path ()
  "Return the system include path for the current buffer."
  (when ede-object
    (ede-system-include-path ede-object)))

(setq company-c-headers-path-system 'ede-object-system-include-path)

;;auto-company-c-headers
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;;git 显示修改文件状态
(global-git-gutter-mode 1)
(require 'git-gutter-fringe)
(set-face-foreground 'git-gutter-fr:modified "purple")
(set-face-foreground 'git-gutter-fr:added    "green")
(set-face-foreground 'git-gutter-fr:deleted  "red")
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)
(setq git-gutter-fr:side 'right-fringe)

;;config markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . markdown-mode))
;;ggtags config
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'python-mode)
              (ggtags-mode 1))))
;;c++
(add-hook 'c++-mode-hook 'ggtags-mode)

;;ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
;;;; Specify how to run the server
(set-variable 'ycmd-server-command '("/usr/local/bin/python3" "/Users/xiaolin/.emacs.d/ycmd/ycmd"))

;;;; Specify a global emacs configuration
(set-variable 'ycmd-global-config "/Users/xiaolin/.emacs.d/ycmd/examples/.ycm_extra_conf.py")

;;;; Completion framework
(company-ycmd-setup)
(add-hook 'after-init-hook #'global-company-mode)  

;;;; Enable flycheck
(flycheck-ycmd-setup)
(add-hook 'after-init-hook #'global-flycheck-mode)  

;; Set always complete immediately
(setq company-idle-delay 0)

;;使用company-mode 来补全英语字母的补全配置

(add-hook 'after-init-hook 'global-company-mode)
;; Don't enable company-mode in below major modes, OPTIONAL
(setq company-global-modes '(not eshell-mode comint-mode erc-mode rcirc-mode))
;; "text-mode" is a major mode for editing files of text in a human language"
;; most major modes for non-programmers inherit from text-mode
(defun text-mode-hook-setup ()
  ;; make `company-backends' local is critcal
  ;; or else, you will have completion in every major mode, that's very annoying!
  (make-local-variable 'company-backends)

  ;; company-ispell is the plugin to complete words
  (add-to-list 'company-backends 'company-ispell)

  ;; OPTIONAL, if `company-ispell-dictionary' is nil, `ispell-complete-word-dict' is used
  ;;  but I prefer hard code the dictionary path. That's more portable.
  (setq company-ispell-dictionary (file-truename "/Users/xiaolin/.emacs.d/misc/english-words.txt")))

(add-hook 'text-mode-hook 'text-mode-hook-setup)

(defun toggle-company-ispell ()
  (interactive)
  (cond
   ((memq 'company-ispell company-backends)
    (setq company-backends (delete 'company-ispell company-backends))
    (message "company-ispell disabled"))
   (t
    (add-to-list 'company-backends 'company-ispell)
    (message "company-ispell enabled!"))))


(provide 'init-packages)
