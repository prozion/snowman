;; Testing 'Left marginal' pattern (p.39)

; <div class="c1"> 
;   <div class="c2">Heading</div>
;   You want to excerpt an element and move it into the left margin.
; </div>
;
; .c1 { position:relative; margin-left:200px; }
; .c2 { position:absolute; left:-200px; top:0; margin:0; }


(load "lib/patterns/block.lsp")
(load "lib/patterns/left_marginal.lsp")
(load "lib/css.lsp")

(setf __html "" __css "") 

(setf $1 nil)

(P:absolute (top "10px") (left "20px") "Sized Absolute")

(assert-like __html (format "<%s class='(%s)'>\n<%s>Sized Absolute</%s>\n</%s>\n" @block "c[0-9]+" @inline @inline @block))
(setf classname (string "." $1)) 
;; important! there is \n in the end of css rule, set it here too!
(set 'css_str_1 (format "%s { position:relative; }\n" classname))
(set 'css_str_2 (format "%s %s { position:absolute; top:10px; left:20px; }\n" classname @inline))
(assert-equal __css (append css_str_1 css_str_2))




