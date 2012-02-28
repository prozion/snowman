(set '@gennames '())

(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

(define (return x) x)

(define (gen-classname)
    (define (genstring)
         (string (abs (crc32 (string (now) 6)))))
    (do-while (not (empty? (filter (curry = (set 'classname (append "c" (genstring)))) @gennames))))
    (extend @gennames (list classname))
    (return classname))

