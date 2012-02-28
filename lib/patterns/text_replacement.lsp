;; 'Text replacement' pattern (p.38)

; <h2 id="h2">Heading 2 <span></span></h2>
;
; #h2 { position:relative; width:250px; height:76px; overflow:hidden; }
; #h2 span { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url("heading.jpg") no-repeat; }

(load "lib/html.lsp")
(load "lib/img/imagemagick.lsp")

(load "lib/patterns/absolute.lsp")
(load "lib/patterns/background-image.lsp")

;; args: '((image "heading_2.jpg") [(text "Heading 2")])
(define (text-replacement)

    (set 'image (eval (lookup 'image (args 0))))
    (set 'text (eval (lookup 'text (args 0))))
    (when (nil? text) (set 'text ""))    
    (set 'img_width ((Img:get-size image) 0))
    (set 'img_height ((Img:get-size image) 1))

    (absolute (list '(top "0px") '(left "0px") (list width (string img_width "px")) (list height (string img_height "px"))
        (list 'outer_text text)) 
        (background-image '((nostyle) (element "div")))))

    ;; The idea how to combine two patterns into the higher pattern?

