(define (filename path)
    (find {\/([\w\d\.]*)$} path 1)
    $1)

(define (return x) x)


