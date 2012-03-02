;; 'Text replacement' pattern (p.38)

; <h2 id="h2">Heading 2 <span></span></h2>
;
; #h2 { position:relative; width:250px; height:76px; overflow:hidden; }
; #h2 span { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url("heading.jpg") no-repeat; }

(load "lib/misc.lsp")
(load "lib/html.lsp")
(load "lib/css.lsp")
(load "lib/img/imagemagick.lsp")

;; args: '((image "heading_2.jpg") [(text "Heading 2")])
(define (text-replacement)

    (set 'start_image_absolute (eval (lookup 'image (args 0)))) 
    (set 'imagename (filename image_location))
    (set 'used_image_relative (image-path imagename))

    (set 'text (eval (lookup 'text (args 0))))
    (when (nil? text) (set 'text ""))    
    (set 'img_width (string ((Img:get-size start_image_absolute) 0)) "px")
    (set 'img_height (string ((Img:get-size start_image_absolute) 1)) "px")
    (set 'idname (genname))

    ;; The idea how to combine two patterns into the higher pattern?
    ;(absolute (list '(top "0px") '(left "0px") (list width img_width) (list height img_height))
        ;(list 'outer_text text)) 
        ;(background-image '((nostyle) (element "div")))))
    
    (extend __html (Html:blockп(list (list id idname)) (string text (Html:inline))))

    (extend __css (Css:rule (Css:selector (Css:id idname)) (list '(position "relative") (list 'width img_width) (list 'height img_height) '(overflow "hidden"))))
    (extend __css (Css:rule (Css:selector (Css:id idname) (Css:inline)) (list '(position "absolute") (list 'width img_width) (list 'height img_height) '(left "0px") '(top "0px") (list 'background-image used_image_relative) '(background-repeat "no-repeat"))))
    (extend __images (list start_image_absolute used_image_relative))
