;; 'Background image' pattern (p.36)

; <span></span>
;
; span { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }


(load "lib/patterns/inline.lsp")
(load "lib/img/img.lsp")

;; (background-image (image "heading2.jpg"))
(context 'P)
(define-macro (background-image)
    (let (idname1 (genname))
        (bind-vars (args))

        (set 'img (Img image))
        (:save-image img)

        (map set '(width height) (map (fn(x) (string (eval x) "px")) (list (:get-width img) (:get-height img))))

        (inline (id idname1))

        (Css:rule ((id idname1)) (background (Css:path (:get-path img)) "no-repeat") (width width) (height height))))

(context MAIN)
