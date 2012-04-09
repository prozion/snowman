#!/usr/bin/newlisp -c

(load "lib/base.lsp")
(load "lib/patterns/marginal_graphic_dropcap.lsp")

(base
    (@dir "tmp/snowman_template")
    (@title "My marginal graphic dropcap")
    (P:marginal-graphic-dropcap 
        (image-margin "30px") (image "resources/tests/files/m.jpg") (fallback-text "M") (t "arginal Graphic Dropcap.")))



