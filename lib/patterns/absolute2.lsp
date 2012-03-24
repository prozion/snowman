
;; 'Absolute2' pattern (p.37)
;
;<div id='s[0-9]+'><span id='s[0-9]+'>Sized Absolute</span></div>
;
;#s[0-9]+ { position:relative; } 
;#s[0-9]+ { position:absolute; top:10px; left:20px; }

(context 'P)

; (P:absolute (top "100px") (left "20px") "Sized Absolute")
(define-macro (absolute2)
    (let (idname1 (genname) _txt (text-args (args)))
        (bind-vars (args))
        ; html:
        (block (id idname1) (inline (id idname2) txt))
        ; css:
        (Css:rule ((id idname1)) ())))

(context MAIN)
