
; conditional uppercase
(define-macro (cond-upper-case condition)
    (if-not (null? (eval condition))
        (fn(x) (upper-case x))
        (fn(x) x)))
 
(define-macro (assert-equal x y , tmp1 tmp2)
    (inc @test_total)
    (if (= (eval x) (eval y))
        (begin 
            (inc @test_ok)
            (when SF (println "assert-equal: OK")))
        (begin 
            (inc @test_failed)
            (println "ERROR: " x " is not equal to " y)
            (set 'tmp1 (if (= x (eval x)) (string "must be " x) (string x " evaluates to " (eval x))))
            (set 'tmp2 (if (= y (eval y)) (string "must be " y) (string y " evaluates to " (eval y))))
            (println tmp1 ", while " tmp2))))

(define-macro (assert-true x)
    (inc @test_total)
    (if (= (eval x) 'true)
        (begin
            (inc @test_ok)
            (when SF (println "assert-true: OK")))
        (begin
            (inc @test_failed)
            (println "ERROR: " x " is not true"))))

(define-macro (assert-nil x)
    (inc @test_total)
    (set 'evalx (eval x))
    (if (= (eval x) nil)
        (begin
            (inc @test_ok)
            (when SF (println "assert-nil: OK")))
        (begin 
            (inc @test_failed)
            (println "ERROR: " x " is not nil"))))

(define-macro (assert-like x y, tmp1 tmp2)
"x is sample to match, y is regex pettern"
    (inc @test_total)
    (let ((evalx (eval x)) (evaly (eval y)))
        (if (find evaly evalx 1)
        (begin 
            (inc @test_ok)
            (when SF (println "regex-assert-equal: OK")))
        (begin 
            (inc @test_failed)
            (println "ERROR: " x " evaluates to " evalx " that doesn't match " y)))))


