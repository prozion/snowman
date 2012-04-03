(load "lib/misc.lsp")

;; (P:inline (class classname) (id idname) (t "some content"))
(context 'P)
(define-macro (inline)
    (let (class nil id nil)
        (bind-vars (clean function? (args)) (prefix '_))
        (extend __html (format "<%s%s>" @inline (tagstr '(class id))))
        (dolist (x (args))
            (when (and (list? x) (not (null? x)))
                (cond
                    ((= (term (x 0)) "t") (extend __html (string (eval (x 1)))))
                    ((function? (x 0)) (eval x)))))
        (extend __html (string "</" @inline ">"))))

(context MAIN)
