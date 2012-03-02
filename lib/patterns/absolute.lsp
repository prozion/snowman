;; 'Absolute' pattern (p.37)
; 
; <div class="positioned">
;   <span class="absolute">Sized Absolute</span>
; </div>
;
; *.positioned { position:relative; }
; *.absolute { position:absolute; top:10px; left:10px; } 

(load "lib/html.lsp")
(load "lib/css.lsp")
(load "lib/misc.lsp")

;; args: '((top "10px") (left "10px") [(width "100px") (height "50px") (text_inner "Inner") (text_outer "Outer")])
(define (absolute)

    (set 'top (eval (lookup 'top (args 0))))
    (set 'left (eval (lookup 'left (args 0))))
    (set 'width (eval (lookup 'width (args 0))))
    (if (nil? width) (set 'width "") (set 'width (append "width:" width)))    
    (set 'height (eval (lookup 'height (args 0))))
    (if (nil? height) (set 'height "") (set 'height (append "height:" height)))    
    (set 'text_inner (eval (lookup 'text_inner (args 0))))
    (when (nil? text_inner) (set 'text_inner ""))    
    (set 'text_outer (eval (lookup 'text_outer (args 0))))
    (when (nil? text_outer) (set 'text_outer ""))    

    (set 'classname1 (string (genname)))
    (set 'classname2 (string (genname))

    (extend __html (Html:div '((class classname1)) 
                        (string text_outer 
                        (Html:span '((class classname2)) 
                            text_inner))))

    (extend __css (Css:rule (Css:selector (Css:. classname1)) '((position "relative") (overflow "hidden"))))
    (extend __css (Css:rule (Css:selector (Css:. classname2)) (list '(position "absolute") (list 'top top) (list 'left) (list 'width width) (list 'height height))))) 
   


