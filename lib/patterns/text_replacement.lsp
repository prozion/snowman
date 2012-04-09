
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

; (P:text-replacement (image "resources/tests/files/heading2.jpg") (fallback-text "Heading 2"))
(define-macro (text-replacement)
    (let (fallback-text "" _imgwidth 0 _imgheight 0)
        (map set '(_image fallback-text) (bindl '("image" "fallback-text") (args)))
        (set 'img (Img _image))
        (:save-image img)
        (setf _imgwidth (string (:get-width img) "px") _imgheight (string (:get-height img) "px"))

        ; Note how css properties come first, before native properties for the pattern. It is a rule:
        (P:inline 
            (css.position "relative") (css.width _imgwidth) (css.height _imgheight) (css.overflow "hidden")
            (t fallback-text) (P:background-image (css.position "absolute") (css.left 0) (css.top 0) (image _image)))))

(context MAIN)
