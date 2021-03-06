;;load file
(global-auto-revert-mode t)


;;选中删除
(delete-selection-mode t)

;disable auto save
(setq auto-save-default t)

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
;;;;hippie auto company Hippie 补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;;照例我们先修复一些现在存在的小问题。首先是自动配对的小问题，在 Emacs Lisp
;;中我们有时候只需要一个 ' 但是 Emacs 很好心的帮我们做了补全，但这并不是我们
;;需要的。我们可以通过下面的代码来让使 Emacs Lisp 在 Emacs 中的编辑变得更方便
;;也可以把上面两句合起来
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;;在添加配置代码后重启 Emacs 使其生效。当然这个方法你也可以运用在其他的各个 Major Mode 中，如果你不想 Emacs 对某些符号进行类似的自动匹配补全。 


;;show-paren-mode 可以使鼠标在括号上是高亮其所匹配的另一半括号，然而我们想要光标在括号内时就高亮包含内容的两个括号，使用下面的代码就可以做到这一点。
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )

;;set default language UTF-8
(set-language-environment "UTF-8")

;;显示时间
(display-time-mode t)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
(setq display-time-format "%y年%m月%d日 %a %H:%M")

(provide 'init-better-defaults)
