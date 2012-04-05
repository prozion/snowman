#! /usr/bin/newlisp

(load "lib/test/asserts.lsp")
(load "lib/base.lsp")

;(set 'except '("marginal_graphic_dropcap_test.lsp" "text_replacement_test.lsp" "left_marginal_test.lsp")) ; which files don't include to the test
(set 'except '())
(set 'include '("inline_test.lsp" "block_test.lsp" "background_image_test.lsp" "absolute_test.lsp" "text_replacement_test.lsp" "left_marginal_test.lsp")) ;..or directly what files to test 
(set (global 'SF) nil) ; successful flag: if true - print results of successful tests, nil - omit them
(set '@test_total 0 '@test_ok 0 '@test_failed 0 '@test_files 0) ; global counters

(define (testfile? filename)
    (find ".+_test\.lsp$" filename 1))

(define (run-in-dir dirname)
    (map (fn(x)
            (println "*** Testing " dirname "/" x)
            (eval-string (read-file (string dirname "/" x)))
            (inc @test_files))
         (filter (fn(x) (and (not (null? include)) (find x include))) 
            (filter testfile? (directory dirname))))
    (unless (null? (directory dirname))
        (map run-in-dir 
            (filter directory? 
                (map (fn(x) (append dirname "/" x)) 
                    (clean (fn(x) (or (= ".." x) (= "." x))) 
                        (directory dirname)))))))
    ;(set 'dirs (filter directory? (map (fn(x) (append dirname "/" x)) (directory dirname))))
    ;(map run-in-dir (clean (fn(x) (or (= x "..") (= x "."))) dirs)))

    ;(map run-in-dir 
    ;    (map (fn(x) (append dirname "/" x))
    ;        (clean (fn(x) (or (= x "..") (= x "."))) 
    ;            (filter directory? (map (fn(x) (append dirname "/" x)) (directory dirname)))))))

(run-in-dir ((exec "pwd") 0))

(println "==============")
(println "TEST REPORT: ")
(println "total number of test files: " @test_files)
(println "tests OK: " @test_ok)
(println "tests " ((cond-upper-case @test_failed) "failed: ") @test_failed) 
(println "total number of assertions: " @test_total)

(exit)
    
