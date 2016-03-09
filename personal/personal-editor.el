(prelude-require-packages
 '(
   comment-dwim-2
   window-numbering
   zygospore
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
; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action) ;
; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
; make TAB works in terminal-coding-system
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)

(provide 'personal-editor)

;;; personal-editor.el ends here
