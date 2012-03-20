;; (P:block (class classname) (id idname) ...)
(context 'P)
(define-macro (block)
    (map set '(class id tagname MAIN:__html) '(nil nil "div" ""))
    (bind-vars (clean function? (args)) (prefix '_))
    (extend MAIN:__html (string "<" tagname " " (tagstr '(class id)) ">"))
    (map eval (filter function? (args)))
    (extend MAIN:__html (string "</" tagname ">")))

(context MAIN)