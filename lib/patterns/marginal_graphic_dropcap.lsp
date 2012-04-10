(load "lib/misc.lsp")
(load "lib/img/img.lsp") ; required to calculate width of the image
(load "lib/patterns/left_marginal.lsp")
(load "lib/patterns/text_replacement.lsp")

(context 'P)

; (P:marginal-graphic-dropcap (image-margin "30px") (image "resources/tests/files/m.jpg") (fallback-text "M") (t "arginal Graphic Dropcap."))
(define-macro (marginal-graphic-dropcap)
    (let (mgd_margin_left "0" image_margin "0px" fallback_text "" txt "")
        (map set '(image_margin _image fallback_text txt) (bindl '("image-margin" "image" "fallback-text" "t") (args)))
        (set 'css_list (css-list (args)))
        (set 'img (Img _image))
        
        (set 'mgd_margin_left (string (+ (int (:get-width img)) (int image_margin)) "px"))

        (P:left-marginal 
            (margin-left mgd_margin_left)
            ; t-left is 3-d type of parameter - connection point: it connects the chunk of other functions which don't change __html but instead return generated __html value
            (t-left (P:text-replacement (image _image) (fallback-text fallback_text)))
            (t-right txt))))

(context MAIN)


