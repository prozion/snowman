#!/usr/bin/newlisp -c

; (load "lib/base.lsp")

; (set 'DIR "tmp1")

; (Base:init
;    '((Base:dir DIR)))

; (Base:generate-template)

; (exit)

(load "lib/base.lsp")
(load "lib/patterns/background_image.lsp")

(base 
    '((dir "tmp1") (stylesheet "styles.css") (title "Testing"))
    (background-image 
        '((title "Background Image") (image "heading2.jpg") (width "250px") (height "76px"))))

