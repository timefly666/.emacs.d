(prelude-require-packages
 '(
   flycheck-tip
   clang-format
   yasnippet
   )
 )

;;
(require 'clang-format)
(setq clang-format-style-option "google")

;;
(require 'flycheck-tip)
(define-key c++-mode-map (kbd "C-c C-n") 'flycheck-tip-cycle)

;;
(require 'yasnippet)
;; (yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; code folding
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))


(provide 'personal-prog)
;;; personal-prog.el ends here
