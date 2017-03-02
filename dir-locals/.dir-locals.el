;; Manual -- Association Lists:
;; Manual -- Per-Directory Local Variables:

(
 (nil . ((eval . (setq company-clang-arguments
                       `(
                         ,(concat "-I" (get-dir-locals-dir) "/include2/")
                         ,(concat "-I" (get-dir-locals-dir) "/include1/")
                         ))
               )))

 company-c-headers-path-user

 (c-mode-common . ((eval . (setq flycheck-clang-include-path
                       `(
                         "/usr/include/mpich2/"
                         "/usr/local/cuda/include/"
                         ,(get-dir-locals-dir)
                         ;; ,(concat (get-dir-locals-dir) "include/")
                         ;; ,(concat (get-dir-locals-dir) "build/src/")
                         ))
               )))
 )
