;; 'Background image' pattern (p.36)

; <div></div>
;
; div { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }

(load "lib/patterns/block.lsp")
(load "lib/img/imagemagick.lsp")

;; (Background-image (image "heading2.jpg"))
(context 'P)
(define-macro (background-image)
    (set 'PNAME "Background image" 'classname (MAIN:genname))
    (bind-vars (args))
    (map set '(image width height) (Img image))
    (map set '(width height) (map (fn(x) (string (eval x) "px")) '(width height)))

    ;(P:start-comment PNAME)))
    (block (class classname))
    ;(P:end-comment PNAME)))

    (Css ((. classname)) (background (Css:path image) "no-repeat") (width width) (height height)))
(context MAIN)
