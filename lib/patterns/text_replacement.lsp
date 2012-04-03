
;; 'Text replacement' pattern (p.38)
;
;<div id='s[0-9]+'>Heading 2<span id='s[0-9]+'></span></div>
;
;   #s[0-9]+ { position:relative; width:250px; height:76px; overflow:hidden; } 
;   #s[0-9]+ { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url('heading2.jpg') no-repeat; }

(load "lib/patterns/block.lsp")
(load "lib/patterns/background_image.lsp")
(load "lib/css.lsp")

(context 'P)

; (P:text-replacement (image "tests/files/heading2.jpg") (fallback-text "Heading 2"))
(define-macro (text-replacement)
    (let (idname1 (genname) _txt (text-args (args)))
        (bind-vars (args))
        (set 'img (Img image))
        (:save-image img)
        (setf imgwidth (string (:get-width img) "px")  imgheight (string (:get-height img) "px"))
        ; html:
        (P:block (id idname1) _txt (P:background-image (image image)))
        ; css:
        (Css:rule ((id idname1)) (position "relative") (width imgwidth) (height imgheight) (overflow "hidden"))))

(context MAIN)
