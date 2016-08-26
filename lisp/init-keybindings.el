;; ;;bind function key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;find file
(global-set-key (kbd "C-c p") 'counsel-git)

;;然后再将其用下面的代码将其绑定为快捷键，第一个 \ 用于将紧跟的 \ 进行逃脱（escape）
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;hippie auto company Hippie 补全
(global-set-key (kbd "s-/") 'hippie-expand)

;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
;;iedit
(global-set-key (kbd "C-;") 'iedit-mode)

;;org keybinding
(global-set-key (kbd "C-c r") 'org-capture)

;;;config conpany
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(global-set-key (kbd "M-s o") 'occur-dwim)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;这个快捷键是切换空格为4个或是2个的切换
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;;auto yasnippet
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

;;evil-leader
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )
;;Evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;;helm-ag
(global-set-key (kbd "C-c C-p s") 'helm-do-ag-project-root)

(global-set-key (kbd "C-w") 'backward-kill-word)

;;some elpy set key info
;;Get docs C-c C-d  ;; elpy-doc
;;M-x elpy-set-test-runner
;;C-c C-t  ;; runs test/ all tests
(global-set-key (kbd "C-M-z") 'undo)
(global-set-key (kbd "C-M-w") 'kill-region)
(provide 'init-keybindings)
