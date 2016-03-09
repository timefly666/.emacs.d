(prelude-require-packages
 '(
   protobuf-mode
   )
 )


;; protobuf
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;;
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

(provide 'personal-modes)

;;; personal-modes.el ends here
