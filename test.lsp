#!/usr/bin/newlisp -c

(load "lib/base.lsp")
(load "lib/patterns/background_image.lsp")

(base 
    '((dir "tmp1") (stylesheet "styles.css") (title "Testing"))
    (background-image 
        '((title "Background Image") (image "/home/denis/tmp/heading2.jpg") (width "250px") (height "76px"))))

