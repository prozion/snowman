;; Testing 'Absolute' pattern (p.37)
; 
; <div class="c1">
;   <span class="c2">Sized Absolute</span>
; </div>
;
; .c1 { position:relative; }
; .c2 { position:absolute; top:10px; left:20px; } 

; (P:absolute (top "10px") (left "20px") "Sized Absolute")

; Remark: inside the pattern it is desirable to combine block and inline patterns
; as e.g.
; (block (class "c1") (inline "Sized Absolute"))
; the real css then will look like
; .c1 ...
; .c1 <inline_tag> ...

(load "lib/patterns/block.lsp")
(load "lib/patterns/absolute.lsp")
(load "lib/css.lsp")

(println "Testing absolute.lsp")

(setf __html "" __css "") 

(setf $1 nil)

(P:absolute (top "10px") (left "20px") "Sized Absolute")

(assert-like __html (format "<%s class='(%s)'>\n<%s>Sized Absolute</%s>\n</%s>\n" @block "c[0-9]+" @inline @inline @block))
(setf classname (string "." $1)) 
;; important! there is \n in the end of css rule, set it here too!
(set 'css_str_1 (format "%s { position:relative; }\n" classname))
(set 'css_str_2 (format "%s %s { position:absolute; top:10px; left:20px; }\n" classname @inline))
(assert-equal __css (append css_str_1 css_str_2))




