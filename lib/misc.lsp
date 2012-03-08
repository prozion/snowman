(set '@gennames '())

; extract filename from the path
(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

; sometimes it is more readable
(define (return x) x)

; generate a name of css class or identificator
(define (genname)
    (define (genstring)
         (string (abs (crc32 (string (now) 6)))))
    (do-until (empty? (filter (curry = (list classname)) @gennames))
        (set 'classname (append "c" (genstring))))
    (extend @gennames (list classname))
    (return classname))

; find a value in assoc list by a key
(define (findval key assoc_list)
    (set 'retval (eval (lookup key assoc_list)))
    (return retval))

; return relative path to the image (imagename), this path can be used in template references
(define (image-path imagename)
    (return (string @imagedir "/" imagename)))

; pattern comments wrap the html code of pattern:
(define (start-comment pattern_name)
    (string "\n<!-- Start of " pattern_name " pattern -->"))
(define (end-comment pattern_name)
    (string "<!-- End of " pattern_name " pattern -->\n"))

; negate value written in string
(define (neg astr)
    (if (= (astr 0) "-") 
        (set 'res (1 astr))
        (set 'res (string "-" astr)))
res)
