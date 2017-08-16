(prelude-require-packages
 '(
   yapfify
   )
 )

(add-hook 'python-mode-hook 'yapf-mode)

(provide 'personal-env-python)

;;; personal-env-python.el ends here
