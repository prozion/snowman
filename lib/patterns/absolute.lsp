;; 'Absolute' pattern (p.37)
; 
; <div class="positioned">[Outer]
;   <span class="absolute">Inner</span>
; </div>

(load "lib/html.lsp")

;; args: '((top "10px") (left "10px") [(text_inner "Inner") (text_outer "Outer")])
(define (absolute)

    (set 'top (eval (lookup 'top (args 0))))
    (set 'left (eval (lookup 'left (args 0))))
    (set 'text_inner (eval (lookup 'text_inner (args 0))))
    (when (nil? text_inner) (set 'text_inner ""))    
    (set 'text_outer (eval (lookup 'text_outer (args 0))))
    (when (nil? text_outer) (set 'text_outer ""))    

    (set 'class_positioned (string @class_prefix "positioned"))
    (set 'class_absolute (string @class_prefix "absolute"))

    (extend __html (Html:div '((class class_positioned)) (string text_outer (Html:span '((class class_absolute)) text_inner))))
    (extend __css ( string "*." class_positioned " { position:relative; } " "*." class_absolute " { position:absolute; top:" top "; left:" left ";}" )))
   


