(load "lib/misc.lsp")

;; (P:block (class classname) (id idname) "some content")
(context 'P)
(define-macro (block)
    (let (class nil id nil _txt (join (filter string? (args))))
        (bind-vars (clean function? (args)) (prefix '_))
        (extend MAIN:__html (format "<%s%s>" @block (tagstr '(class id))))
        (unless (empty? _txt) (extend MAIN:__html _txt))
        (map eval (filter function? (args)))
        (extend MAIN:__html (format "</%s>" @block))))

(context MAIN)
