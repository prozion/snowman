(load "lib/misc.lsp")

;; (P:block (class classname) (id idname) "some content")
(context 'P)
(define-macro (block)
    (let (class nil id nil _txt (text-args (args))) 
        (bind-vars (clean function? (args)) (prefix '_))
        (extend __html (format "<%s%s>" @block (tagstr '(class id))))
        (unless (empty? _txt) (extend __html _txt))
        (map eval (filter function? (args)))
        (extend __html (format "</%s>" @block))))

(context MAIN)
