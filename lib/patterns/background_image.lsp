;; 'Background image' pattern (p.36)

; <span></span>
;
; span { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }


(load "lib/patterns/inline.lsp")
(load "lib/img/img.lsp")

;; (background-image (image "heading2.jpg"))
(context 'P)
(define-macro (background-image)
    (let (_arglst "" image "" _background "" _width "0" _height "0")
        (map set '(image) (bindl '("image") (args)))
        (set 'css_str (css-str (args)))

        (set 'img (Img image))
        (:save-image img)

        (map set '(_width _height) (map (fn(x) (string (eval x) "px")) (list (:get-width img) (:get-height img))))
        (set '_background (format "url('%s') no-repeat" (:get-path img)))

        (set '_arglst
            (clean null? 
                (extend 
                    (css-list (args))
                    '((css.margin "0") (css.width _width) (css.height _height) (css.background _background)))))

        (inline _arglst))) 

(context MAIN)
