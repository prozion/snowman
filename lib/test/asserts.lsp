
(define-macro (assert-equal x y)
    (if (= (eval x) (eval y))
        (when SF (println "assert-equal: OK"))
        (begin 
            (println "ERROR: " x " is not equal to " y)
            (println x " evaluates to " (eval x) ", while " y " evaluates to " (eval y)))))

(define-macro (assert-true x)
    (if (= (eval x) 'true)
        (when SF (println "assert-true: OK"))
        (println "ERROR: " x " is not true")))

(define-macro (assert-nil x)
    (set 'evalx (eval x))
    (if (= (eval x) nil)
        (when SF (println "assert-nil: OK"))
        (println "ERROR: " x " is not nil")))
