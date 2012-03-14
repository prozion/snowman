;; (Inline (class classname) (id idname) "some content")
(context 'Inline)
(define-macro (Inline:Inline)
    (map set '(class id tagname MAIN:__html) '(nil nil "span" ""))
    (P:bind-vars (clean P:function? (args)) (prefix '_))
    (extend MAIN:__html (string "<" tagname " " (tagstr '(class id)) ">"))
    (map eval (filter P:function? (args)))
    (extend MAIN:__html (string "</" tagname ">")))

; generate string: name1='value1' name2='value2' ...
(define (tagstr li)
    (set 'res "")
    (dolist (_x li)
        ;(println "inline.lsp: tagstr: _x: " _x ", (eval _x): " (eval _x))
        (set '_val (eval _x))
        (when (not (null? _val)) (extend res (string (term _x) "='" _val "' "))))
    res)

(context MAIN)
