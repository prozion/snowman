;; 'Absolute' pattern (p.37)
; 
; <div id="idname1">
;   <span id="idname2">Sized Absolute</span>
; </div>
;
; #idname1 { position:relative; }
; #idname2 { position:absolute; top:10px; left:10px; } 

(load "lib/patterns/block.lsp")
(load "lib/patterns/inline.lsp")

(context 'P)

; (P:absolute (top "10px") (left "20px") (t "Sized Absolute"))
(define-macro (absolute)
    (let (t "" top "0" left "0" txt "") 
        ;(bind-vars (args))    
        (set 
            'top (eval (lookup 'top (args)))
            'left (eval (lookup 'left (args)))
            't (eval (lookup 't (args))))

        (set 'txt t)

        (block (css.position "relative") (inline (css.position "absolute") (css.top top) (css.left left) (t txt)))))

        ;(Css:rule ((id idname1)) (position "relative"))
        ;(Css:rule ((id idname2)) (position "absolute") (top top) (left left))))
    
(context MAIN)

