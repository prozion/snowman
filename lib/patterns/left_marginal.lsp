
;; 'Left marginal' pattern (p.39)
;
;<div id='s[0-9]+'><div id='s[0-9]'>Heading</div>text</div>
;
;   #s[0-9]+ { position:relative; margin-left: 200px; } 
;   #s[0-9]+ { position:absolute; left:-200px; top:0; margin:0; }

(context 'P)

; (P:left-marginal (margin-left "200px") (t "Heading") (t "text"))
(define-macro (left-marginal)
    (let (idname1 (genname) t "")
        (bind (args))
        ; html:
        (P:block (margin-left <<margin_left>>) (P:inline <<last-1>>) (t <<last>>))))

(context MAIN)
