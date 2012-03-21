(load "lib/misc.lsp")

;; (P:block (class classname) (id idname) "some content")
(context 'P)
(define-macro (block)
    (set '_txt (join (filter string? (args))))
    (map set '(class id) '(nil nil))
    (bind-vars (clean function? (args)) (prefix '_))

    (extend MAIN:__html (format "<%s%s>" "div" (tagstr '(class id))))
    (unless (empty? _txt) (extend MAIN:__html _txt))
    (map eval (filter function? (args)))
    (extend MAIN:__html (format "</%s>" "div")))

(context MAIN)
