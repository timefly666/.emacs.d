(prelude-require-packages
 '(
   monokai-theme
   column-enforce-mode
   fill-column-indicator
   neotree
   )
 )

;;
(disable-theme 'zenburn)
(load-theme 'monokai t)

;;
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; enforce the line length to be 80
(add-hook 'c-mode-common-hook 'column-enforce-mode)
(add-hook 'python-mode-hook 'column-enforce-mode)
(add-hook 'c-mode-common-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)
(setq fci-rule-column 80)

;; xml indent
(setq nxml-child-indent 2)
(setq nxml-attribute-indent 2)

(provide 'personal-ui)
;;; personal-ui.el ends here
