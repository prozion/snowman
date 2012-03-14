(load "lib/misc.lsp")

(context 'Img)

; extract filename from the path
(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

; return relative path to the image (imagename), this path can be used in template references
(define (image-path imagename)
    (string MAIN:@imagedir "/" imagename))

(define (get-size path)
    (set 'size_part ((parse ((exec (string "identify " path)) 0) " ") 2))
    (set 'width ((parse size_part "x") 0))
    (set 'height ((parse size_part "x") 1))
    (list width height))

(define (Img:Img initial_path)
    (MAIN:setl '(width height) (get-size initial_path))
    (set 'imagename (filename initial_path))
    (set 'template_imagepath (image-path imagename))
    (copy-file initial_path (string MAIN:@dir "/" template_imagepath))
    (list template_imagepath width height))

(context MAIN)

