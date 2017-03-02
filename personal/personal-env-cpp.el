(add-to-list 'load-path "~/.emacs.d/3rd_party/custom")
(add-to-list 'load-path "~/.emacs.d/3rd_party/package/flycheck-google-cpplint")

(prelude-require-packages
 '(
   google-c-style
   company-c-headers
   )
 )

;;---------- google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;---------- cpplint
; define cpplint function to check the code style
(defun cpplint ()
  "check source code format according to Google Style Guide"
  (interactive)
  (compilation-start (concat "python ~/.emacs.d/3rd_party/tool/google/cpplint.py " (buffer-file-name))))

(require 'flycheck-google-cpplint)
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                '(warning . c/c++-googlelint))))
     ;; (flycheck-add-next-checker 'c/c++-clang
     ;;                            '(warning . c/c++-googlelint))))

(custom-set-variables
 '(flycheck-googlelint-verbose "3")
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 ;; '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-linelength "120")
 )

(custom-set-variables
 '(flycheck-c/c++-googlelint-executable (expand-file-name "~/.emacs.d/3rd_party/tool/google/cpplint.py")))

;;---------- flycheck
;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))

;;---------- company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; company with clang
(delete 'company-semantic company-backends)
(define-key c-mode-map [(control tab)] 'company-complete)
(define-key c++-mode-map [(control tab)] 'company-complete)

;;
;; company-c-headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

;;---------- path
;; by default only /usr/include/ and /usr/local/include/ are included
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9/")

;;---------- set hook
;; hook
(add-hook 'c-mode-common-hook 'env-cpp-defaults)

(defun env-cpp-defaults ()
  ;;---------- Compilation
  (global-set-key (kbd "<f5>") (lambda ()
                                 (interactive)
                                 (setq-local compilation-read-command nil)
                                 (call-interactively 'compile)))
  ;;---------- clang
  (require 'setup-helm-gtags)
  ;; (require 'setup-ggtags)

  ;;---------- cedet
  ;; (require 'setup-cedet)
)

(provide 'personal-env-cpp)
;;; personal-env-cpp.el ends here
