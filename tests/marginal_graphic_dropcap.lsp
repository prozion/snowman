;; Testing 'Marginal graphic dropcap' pattern (p.40)

; <div class="c1"><span class="c2">M<span></span></span>arginal Graphic Dropcap. The letter M has been covered by the dropcap image. Screen readers read the text and visual users see the image. If the browser cannot display the dropcap image, the text becomes visible.</p>

; .c1 { position:relative; margin-left:150px }
; .c2 { position:absolute; width:120px; heigth:90px; left:-120px; top:0 }
; .c2 span { position:absolute; width:120px; height:90px; margin:0; left:0; top:0; background:url("m.jpg") no-repeat; }


(load "lib/patterns/block.lsp")
(new Class 'Img) (load "lib/patterns/background_image.lsp")
(load "lib/patterns/marginal_graphic_dropcap.lsp")
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




