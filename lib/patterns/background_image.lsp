;; 'Background image' pattern (p.36)

(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

;; args: '((title "Background Image") (image "heading2.jpg") (width "250px") (height "76px"))
(define (background-image)
    (set 'title (eval (lookup 'title (args 0))))

    (set 'image_location (eval (lookup 'image (args 0)))) 
    (set 'imagename (filename image_location))
    (set 'new_image_location (string @dir "/" @imagedir "/" imagename))
    (println "image_location: " image_location)
    (println "new_image_location: " new_image_location)
    (copy-file image_location new_image_location)

    (set 'width (eval (lookup 'width (args 0))))
    (set 'height (eval (lookup 'height (args 0))))

    (extend __html (string "<h1>" title "</h1><div></div>"))
    (extend __css (string "div { background:url('" @imagedir "/" imagename "') no-repeat; width:" width "; height:" height "; }"))
    (extend __images '(image)))
   


