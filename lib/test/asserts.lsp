
; conditional uppercase
(define-macro (cond-upper-case condition)
    (if-not (null? (eval condition))
        (fn(x) (upper-case x))
        (fn(x) x)))
 
(define-macro (assert-equal x y)
    (inc @test_total)
    (if (= (eval x) (eval y))
        (begin 
            (inc @test_ok)
            (when SF (println "assert-equal: OK")))
        (begin 
            (inc @test_failed)
            (println "ERROR: " x " is not equal to " y)
            (println x " evaluates to " (eval x) ", while " y " evaluates to " (eval y)))))

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
