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

;;设置鼠标属性
(setq-default cursor-type 'bar)

;;禁止备份文件
(setq make-backup-files nil)

;;选中显示当前的行
(global-hl-line-mode t)

;;加载主题
(load-theme 'monokai t)


(provide 'init-ui)
