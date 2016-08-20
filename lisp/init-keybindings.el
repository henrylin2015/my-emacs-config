;;bind function key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;find file
(global-set-key (kbd "C-c p") 'counsel-git)

;;然后再将其用下面的代码将其绑定为快捷键，第一个 \ 用于将紧跟的 \ 进行逃脱（escape）
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;hippie auto company Hippie 补全
(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-keybindings)
