;; 'Marginal graphic dropcap' pattern (p.40)

; <p class="indent"><span class="graphic-dropcap">M<span></span></span>arginal Graphic Dropcap. The letter M has been covered by the dropcap image. Screen readers read the text and visual users see the image. If the browser cannot display the dropcap image, the text becomes visible.</p>

; *.indent { position:relative; margin-left:150px }
; *.graphic-dropcap { position:absolute; width:120px; heigth:90px; left:-120px; top:0 }
; *.graphic-dropcap span { position:absolute; width:120px; height:90px; margin:0; left:0; top:0; background:url("m.jpg") no-repeat; }

(load "lib/misc.lsp")
(load "lib/html.lsp")
(load "lib/css.lsp")

;; (marginal-graphic-dropcap
;;        '((image "m.jpg") (fallback_text "M") (margin "200px")) 
;;        "arginal Graphic Dropcap. The letter M has been covered by the dropcap image. Screen readers read the text and visual users see the image. If the browser cannot display the dropcap image, the text becomes visible.")
(define (marginal-graphic-dropcap)

    (set 'PNAME "Marginal graphic dropcap")

    (set 'margin (eval (lookup 'margin (args 0))))
    (when (nil? margin) (set 'margin "0px"))    
    (set 'fallback_text (eval (lookup 'fallback_text (args 0))))
    (set 'text (if (>= (length (args)) 2) (args 1) ""))

    (text-replacement
        (list (list 'image image))
        fallback_text)

    (left-marginal 
        (list (list 'margin margin))
        text))

