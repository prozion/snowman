(load "lib/misc.lsp")

;; (P:inline (class classname) (id idname) "some content")
(context 'P)
(define-macro (inline)
    (let (class nil id nil _txt (text-args (args)))
        (bind-vars (clean function? (args)) (prefix '_))
        (extend __html (format "<%s%s>" @inline (tagstr '(class id))))
        (unless (empty? _txt) (extend __html _txt))
        (map eval (filter function? (args)))
        (extend __html (string "</" @inline ">"))))

(context MAIN)
