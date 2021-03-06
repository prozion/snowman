(load "lib/misc.lsp")

;; testing function?
(println "function?")

(assert-nil (P:function? "hello"))
(assert-nil (P:function? 3))
(assert-nil (P:function? 3.0))
(assert-nil (P:function? '()))
(assert-nil (P:function? ""))
(assert-nil (P:function? nil))
(assert-nil (P:function? true))

(define (somefunc))
(assert-true (P:function? (string "hello")))
(assert-true (P:function? (somefunc)))
(assert-true (P:function? (somefunc (+ 2 2) 5)))
(assert-true (P:function? (+ 2 2)))

(set 'a '(string "hello"))
(assert-true (P:function? a))

(load "lib/patterns/inline.lsp")
(assert-equal (filter P:function? '("hello" (P:inline) (string "hello") (somefunc) (width "200"))) '((P:inline) (string "hello") (somefunc)))

(println "paired?")
(assert-true (P:paired? '(1 2)))
(assert-true (P:paired? '(a b)))
(assert-true (P:paired? '(string "hello")))
(assert-true (P:paired? '((+ 1 2) (somefunc))))
(assert-true (P:paired? '(somefunc 5)))
(assert-true (P:paired? '(() ())))
(assert-true (P:paired? '(nil a)))
(assert-true (P:paired? '(nil nil)))

(assert-nil (P:paired? '()))
(assert-nil (P:paired? '(1 2 3)))
(assert-nil (P:paired? 'a))
(assert-nil (P:paired? (somefunc)))
(assert-nil (P:paired? '((1 2))))
(assert-nil (P:paired? "hello"))
(assert-nil (P:paired? nil))
(assert-nil (P:paired? p))

(println "bind-vars")

(context 'P)
(set 'a nil 'b nil 'c nil)
(P:bind-vars '((a 1) (b 2) (c 3)))
(MAIN:assert-equal a 1)
(MAIN:assert-equal b 2)
(MAIN:assert-equal c 3)

(set 'a nil 'b nil)
(P:bind-vars '((a 1.0) (b "hello") ))
(MAIN:assert-equal a 1.0)
(MAIN:assert-equal b "hello")

(set 'a nil 'b nil 'hello nil)
(P:bind-vars '((a 1) "hello" ("hello" 10)))
(MAIN:assert-equal a 1)
(MAIN:assert-equal hello nil)

(set 'a nil 'b nil 'c nil)
(P:bind-vars '((a '(1 2 3)) (b 2 2) (c (+ 2 2))))
(MAIN:assert-equal a '(1 2 3))
(MAIN:assert-equal b nil)
(MAIN:assert-equal c 4)

(set 'C:a nil 'C:b nil 'C:c nil)
(P:bind-vars '((C:a 1) (C:b 2) (C:c 3)) 'C)
(MAIN:assert-equal C:a 1)
(MAIN:assert-equal C:b 2)
(MAIN:assert-equal C:c 3)

(context MAIN)

(println "text-args")

(define-macro (textargs-macro)
    (text-args (args)))

(define (textargs-func)
    (text-args (args)))
    
(assert-equal (textargs-macro) "")
(assert-equal (textargs-macro "hello") "hello")
(assert-equal (textargs-macro "hello" " world") "hello world")
(assert-equal (textargs-macro (+ 2 2) "hello") "hello")
(assert-equal (textargs-macro (string "something")) "")
(assert-equal (textargs-macro "hello" (+ 2 2) { world}) "hello world")
(assert-equal (textargs-macro "") "")

(assert-equal (textargs-func) "")
(assert-equal (textargs-func "hello") "hello")
(assert-equal (textargs-func "hello" " world") "hello world")
(assert-equal (textargs-func (+ 2 2) "hello") "hello")
(assert-equal (textargs-func (string "something")) "something")
(assert-equal (textargs-func "hello" (+ 2 2) { world}) "hello world")
(assert-equal (textargs-func "") "")

(set 'txt "some text")
(set 'num 5)
(assert-equal (textargs-macro txt) "some text")
(assert-equal (textargs-macro txt " etc") "some text etc")
(assert-equal (textargs-macro (string "hello") txt " etc") "some text etc")
(assert-equal (textargs-macro num txt " etc") "some text etc")
(assert-equal (textargs-macro nil txt " etc") "some text etc")
(assert-equal (textargs-macro txt "" " " ""  "etc") "some text etc")

(context MAIN)
