#! /usr/bin/newlisp

(load "lib/test/asserts.lsp")

(set 'except '()) ; which files don't include to the test
(set 'SF nil) ; successful flag: if true - print results of successful tests, nil - omit them

(set 'lib_files (filter (fn(x) (find "\.lsp$" x 1)) (directory "tests")))
(set 'lib_files (difference lib_files except))

(dolist (l lib_files)
    (eval-string (read-file (string "tests/" l))))

(exit)
    
