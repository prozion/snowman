;; 'Left marginal' pattern (p.39)

; <div class="left-marginal"> 
;   <h2 class="marginal-heading">Heading</h2>
;   You want to excerpt an element and move it into the left margin.
; </div>
;
; .left-marginal { position:relative; margin-left:200px; }
; .marginal-heading { position:absolute; left:-200px; top:0; margin:0; }

(load "lib/misc.lsp")
(load "lib/html.lsp")
(load "lib/css.lsp")

;; (left-marginal
;;        '((margin "200px"))
;;        "You want to excerpt an element and move it into the left margin.")
(define (left-marginal)

    (set 'PNAME "Left marginal")

    (set 'margin (eval (lookup 'margin (args 0))))
    (when (nil? margin) (set 'margin "0px"))    
    (set 'classname (genname) 'classname_heading (string classname "-heading"))
    (set 'atext (if (>= (length (args)) 2) (args 1) ""))
    (set 'heading_text (eval (lookup 'heading_text (args 0))))

    (extend __html 
        (start-comment PNAME)
        (Html:block 
            (list (list 'class classname)) 
            (string 
                (Html:inline
                   (list (list 'class classname_heading))
                   heading_text)
                atext))
        (end-comment PNAME))

    (extend __css (Css:rule 
                    (Css:selector 
                        (Css:. classname)) 
                    (list '(position "relative") (list 'margin-left margin))))

    (extend __css (Css:rule 
                    (Css:selector 
                        (Css:. classname_heading)) 
                    (list '(position "absolute") (list 'left (string (neg margin))) '(top "0") '(margin "0")))))
