;; 'Background image' pattern (p.36)

; <div></div>
;
; div { background:url("heading2.jpg") no-repeat; width:250px; height:76px; }

(load "lib/misc.lsp") ;; load (filename)
(load "lib/html.lsp")
(load "lib/css.lsp")

;; args: '((image "heading2.jpg") [(width "250px") (height "76px") (nostyle) (element "div")])
(define (background-image)

    (set 'start_image_absolute (eval (lookup 'image (args 0)))) 
    (set 'imagename (filename start_image_absolute))
    (set 'used_image_relative (image-path imagename))

    (set 'width (eval (lookup 'width (args 0))))
    (set 'height (eval (lookup 'height (args 0))))

    (set 'nostyle (eval (lookup 'nostyle (args 0))))
    (set 'element (eval (lookup 'element (args 0))))
    (if (nil? element) (set 'element @default_block_element))

    ;; if width or height are not given, use image size autodection
    (when (or (nil? width) (nil? height))
        (load "lib/img/imagemagick.lsp")
        (set 'img_sizes (Img:get-size start_image_absolute))
        (set 'width (string (img_sizes 0) "px"))
        (set 'height (string (img_sizes 1) "px"))) 

    (set 'classname (genname))

    (extend __html (Html:block (list (list 'class classname)) ""))
    (extend __css (Css:rule (Css:selector (Css:. classname)) (list (list 'background-image used_image_relative) '(background-repeat "no-repeat") (list 'width width) (list 'height height))))
    (extend __images (list (list start_image_absolute used_image_relative))))

   


