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

; (P:absolute (top "10px") (left "20px") "Sized Absolute")
(define-macro (absolute)
    (let (idname1 (genname) idname2 (genname) _txt (text-args (args)))
        (bind-vars (args))    
        (set 'txt _txt)
        (block (id idname1) (inline (id idname2) txt))
        (Css:rule ((id idname1)) (position "relative"))
        (Css:rule ((id idname2)) (position "absolute") (top top) (left left))))
    
(context MAIN)
