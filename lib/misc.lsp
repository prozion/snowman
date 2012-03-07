(set '@gennames '())

(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

(define (return x) x)

(define (genname)
    (define (genstring)
         (string (abs (crc32 (string (now) 6)))))
    (do-until (empty? (filter (curry = (list classname)) @gennames))
        (set 'classname (append "c" (genstring))))
    (extend @gennames (list classname))
    (return classname))

(define (findval val assoc_list)
    (set 'retval (eval (lookup val assoc_list)))
    (return retval))

(define (image-path imagename)
    (return (string @imagedir "/" imagename)))

; pattern comments wrap the html code of pattern:
(define (start-comment pattern_name)
    (string "\n<!-- Start of " pattern_name " pattern -->"))
(define (end-comment pattern_name)
    (string "<!-- End of " pattern_name " pattern -->\n"))
