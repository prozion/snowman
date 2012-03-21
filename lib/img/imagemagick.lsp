(load "lib/misc.lsp")

(context 'Img)

(define (Img:Img i_path)
"(Img path width height newpath)"
    (MAIN:setl '(width height) (get-size i_path))
    (list (context) i_path width height (image-path (filename i_path))))

;; protected
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

;; public
(define (save-image)
    (copy-file (self 1) (string MAIN:@dir "/" (self 4))))

(define (get-width)
    (self 2))

(define (get-height)
    (self 3))

(define (get-path)
    (self 4))

(context MAIN)

