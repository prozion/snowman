#!/usr/bin/newlisp -c

(load "lib/base.lsp")
(load "lib/patterns/background_image.lsp")

(base
    (@dir "tmp1")
    (@stylesheet "styles.css")
    (@title "Testing")
    (Background-image
        (image "/home/denis/tmp/heading2.jpg")))

;(base 
;    '((dir "tmp1") (stylesheet "styles.css") (title "Testing"))
;    (background-image 
;        '((title "Background Image") (image "/home/denis/tmp/heading2.jpg") ))
;    (absolute  
;       '((top "10px") (left "10px") (width "100px") (height "50px") (text_inner "Inner") (text_outer "Outer")))
;    (text-replacement 
;        '((image "/home/denis/tmp/heading2.jpg") (text "Heading 2")))
;    (left-marginal
;        '((margin "200px"))
;        "You want to excerpt an element and move it into the left margin."))


