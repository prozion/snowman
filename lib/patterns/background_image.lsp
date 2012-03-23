;; 'Background image' pattern (p.36)

; <div></div>
;
; div { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }


(load "lib/patterns/block.lsp")
(load "lib/img/imagemagick.lsp")

;; (background-image (image "heading2.jpg"))
(context 'P)
(define-macro (background-image)
    (set 'PNAME "Background image" 'classname (genname))
    (bind-vars (args))

    (set 'img (Img image))
    (:save-image img)

    (map set '(width height) (map (fn(x) (string (eval x) "px")) (list (:get-width img) (:get-height img))))

    ;(P:start-comment PNAME)))
    (block (class classname))
    ;(P:end-comment PNAME)))

    (Css:rule ((. classname)) (background (Css:path (:get-path img)) "no-repeat") (width width) (height height)))

(context MAIN)
