(prelude-require-packages
 '(
   comment-dwim-2
   window-numbering
   zygospore
   helm
   )
 )

;; PACKAGE: comment-dwim-2
(global-set-key (kbd "M-;") 'comment-dwim-2)

;;
(require 'window-numbering)
(window-numbering-mode t)

;; PACKAGE: zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;; PACAKGE: Helm
(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'personal-editor)
;;; personal-editor.el ends here
