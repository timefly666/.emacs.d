(add-to-list 'load-path "~/.emacs.d/3rd_party/custom")
(add-to-list 'load-path "~/.emacs.d/3rd_party/libs/google")

(prelude-require-packages
  '(
    flycheck-google-cpplint
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
  (compilation-start (concat "python ~/.emacs.d/3rd_party/libs/google/cpplint.py " (buffer-file-name))))

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     ;; (flycheck-add-next-checker 'c/c++-paycheck
     ;; '(warning . c/c++-googlelint)))

     ;; (flycheck-add-next-checker 'c/c++-clang
                                ;; '(warning . c/c++-googlelint))))

     (flycheck-add-next-checker 'c/c++-clang
                                '(t . c/c++-googlelint))))


(custom-set-variables
 '(flycheck-c/c++-googlelint-executable (expand-file-name "~/.emacs.d/3rd_party/libs/google/cpplint.py")))

(custom-set-variables
 '(flycheck-googlelint-verbose "3")
 '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
 ;; '(flycheck-googlelint-root "project/src")
 '(flycheck-googlelint-linelength "120")
 )

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map [(control tab)] 'company-complete)
(define-key c++-mode-map [(control tab)] 'company-complete)

;; company-c-headers
(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
;; by default only /usr/include/ and /usr/local/include/ are included
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8.5/")

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
