;; 'Background image' pattern (p.36)

(define (filename path)
    (find {\/([\w\d]*)$} path 1)
    $1)

;; args: '((title "Background Image") (image "heading2.jpg") (width "250px") (height "76px"))
(define (background-image)
    (set 'title (eval (lookup 'title (args 0))))

    (set 'image (eval (lookup 'image (args 0)))) ;; TODO: take image at the pointed random location and move it to some images folder of generated template. Stylesheet will have the new (now relative) location in its url(...)
    (set 'imagename (filename image))

    (set 'width (eval (lookup 'width (args 0))))
    (set 'height (eval (lookup 'height (args 0))))

    (println "background_image.lsp: __html before: " __html)
    (extend __html (string "<h1>" title "</h1><div></div>"))
    (println "backround_iamge.lsp: __html after: " __html)
    (extend __css (string "div { background:url('" @imagedir "/" imagename "') no-repeat; width:" width "; height:" height "; }"))
    (extend __images '(image)))
   


