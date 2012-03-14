;; 'Background image' pattern (p.36)

; <div></div>
;
; div { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }

(load "lib/misc.lsp") 
(load "lib/css.lsp")

;; (Background-image (image "heading2.jpg"))
(context 'Background-image)
(define-macro (Background-image:Background-image)
    (set 'PNAME "Background image")
    (P:bind-vars (args) (prefix '_))
    ;(map set '(image width height) (Img image))
    ;(println "background_image.lsp: image: " image)
    (set 'classname (MAIN:genname))

    ;(P:start-comment PNAME)))
    (Inline (class classname))
    ;(P:end-comment PNAME)))

    ;(Css ((. classname)) (background (Css:path image) "no-repeat") (width width) (height height)))
    buf)
(context MAIN)
