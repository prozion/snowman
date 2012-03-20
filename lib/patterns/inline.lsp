(load "lib/misc.lsp")

;; (P:inline (class classname) (id idname) "some content")
(context 'P)
(define-macro (inline)
    (set '_txt_lst (filter string? (args)))
    (set '_txt (join _txt_lst)) 
    (map set '(class id tagname) '(nil nil "span"))
    (bind-vars (clean function? (args)) (prefix '_))

    (extend MAIN:__html (string "<" tagname (tagstr '(class id)) ">"))
    (unless (empty? _txt) (extend MAIN:__html _txt))
    (map eval (filter function? (args)))
    (extend MAIN:__html (string "</" tagname ">")))

(context MAIN)
