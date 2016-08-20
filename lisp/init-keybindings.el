;;bind function key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;find file
(global-set-key (kbd "C-c p") 'counsel-git)

(provide 'init-keybindings)
