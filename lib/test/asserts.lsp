
(define-macro (assert-equal x y)
    (if (= (eval x) (eval y))
        (println "true")
        (println "ERROR: " x " is not equal to " y)))
