#! /usr/bin/newlisp

(load "lib/test/asserts.lsp")

(set 'lib_files (filter (fn(x) (find "\.lsp$" x 1)) (directory "tests")))
(dolist (l lib_files)
    (eval-string (read-file (string "tests/" l))))

(exit)
    
