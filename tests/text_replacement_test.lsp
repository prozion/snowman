;; Testing 'Text replacement' pattern (p.38)

; <div id="h2">Heading 2 <span></span></div>
;
; #h2 { position:relative; width:250px; height:76px; overflow:hidden; }
; #h2 span { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url("heading.jpg") no-repeat; }


(load "lib/patterns/block.lsp")
(load "lib/patterns/text_replacement.lsp")
(new Class 'Img) (load "lib/patterns/background_image.lsp")
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




