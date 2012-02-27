;; 'Background image' pattern (p.36)

(load "lib/misc.lsp") ;; load (filename)
(load "lib/html.lsp")

;; args: '((image "heading2.jpg") [(width "250px") (height "76px")])
(define (background-image)

    (set 'image_location (eval (lookup 'image (args 0)))) 
    (set 'imagename (filename image_location))
    (set 'new_image_location (string @dir "/" @imagedir "/" imagename))
    (copy-file image_location new_image_location)

    (set 'width (eval (lookup 'width (args 0))))
    (set 'height (eval (lookup 'height (args 0))))

    ;; if width or height are not given, use image size autodection
    (when (or (nil? width) (nil? height))
        (load "lib/img/imagemagick.lsp")
        (set 'img_sizes (Img:get-size image_location))
        (set 'width (string (img_sizes 0) "px"))
        (set 'height (string (img_sizes 1) "px"))) 

    (extend __html (Html:div))
    (extend __css (string "div { background:url('" @imagedir "/" imagename "') no-repeat; width:" width "; height:" height "; }"))
    (extend __images '(image)))
   


