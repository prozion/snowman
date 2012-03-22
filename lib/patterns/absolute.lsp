;; 'Absolute' pattern (p.37)
; 
; <div class="positioned">
;   <span class="absolute">Sized Absolute</span>
; </div>
;
; *.positioned { position:relative; }
; *.absolute { position:absolute; top:10px; left:10px; } 

(load "lib/css.lsp")
(load "lib/misc.lsp")

(context 'P)

;; args: '((top "10px") (left "10px") [(width "100px") (height "50px") (text_inner "Inner") (text_outer "Outer")])
(define-macro (absolute)
    (set 'PNAME "Absolute"))

     
(context MAIN)
