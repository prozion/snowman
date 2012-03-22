;; 'Left marginal' pattern (p.39)

; <div class="left-marginal"> 
;   <h2 class="marginal-heading">Heading</h2>
;   You want to excerpt an element and move it into the left margin.
; </div>
;
; .left-marginal { position:relative; margin-left:200px; }
; .marginal-heading { position:absolute; left:-200px; top:0; margin:0; }

(load "lib/misc.lsp")
(load "lib/css.lsp")

(context 'P)

(define (left-marginal)
    (set 'PNAME "Left marginal"))

(context MAIN)

