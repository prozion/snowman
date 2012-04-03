(load "lib/misc.lsp")
(load "lib/css.lsp")

(load "lib/img/img.lsp") ; required to calculate width of the image
(load "lib/patterns/left_marginal.lsp")
(load "lib/patterns/text_replacement.lsp")

(context 'P)

; (P:marginal-graphic-dropcap (image-margin "30px") (image "tests/files/m.jpg") (fallback-text "M") "arginal Graphic Dropcap.")
(define (marginal-graphic-dropcap)
    (bind-args (args))
    (set 'img (Img image))
    ;(set 'text ())

    (P:left-marginal 
        (margin-left (+ image_width margin_from_image))
        (P:text-replacement (image "tests/files/m.jpg") (fallback-text "M"))
        text))

(context MAIN)


