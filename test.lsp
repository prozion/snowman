#!/usr/bin/newlisp -c

(load "lib/base.lsp")
(load "lib/patterns/background_image.lsp")
;(load "lib/patterns/absolute.lsp")
;(load "lib/patterns/text-replacement.lsp")

(base 
    '((dir "tmp1") (stylesheet "styles.css") (title "Testing"))
    (background-image 
        '((title "Background Image") (image "/home/denis/tmp/heading2.jpg") ))
    ;(absolute  
    ;    '((top "10px") (left "10px") (width "100px") (height "50px") (text_inner "Inner") (text_outer "Outer")))
    ;(text-replacement 
    ;    '((image "/home/denis/tmp/heading_2.jpg") (text "Heading 2")))
)


