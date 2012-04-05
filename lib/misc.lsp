; Here are the helper functions

; all the generated names to ensure we have unique name for each class or id
(set '@gennames '())

; generate a name of css class or identificator
(define (genname)
    (define (genstring)
         (string (abs (crc32 (string (now) 6)))))
    (do-until (empty? (filter (curry = (list classname)) @gennames))
        (set 'classname (append "s" (genstring))))
    (extend @gennames (list classname))
    classname)
(global 'genname)

; find a value in assoc list by a key
(define (findval key assoc_list)
    (set 'retval (eval (lookup key assoc_list)))
    (return retval))

; negate value written in string
(define (neg astr)
    (if (= (astr 0) "-") 
        (set 'res (1 astr))
        (set 'res (string "-" astr)))
res)

; devised to transform args to assoc-list
(define (assoc-list al)
    (set 'res '())
    (dolist (_x al)
        (extend res (list (push (first _x) (rest _x)))))
    res)

(context 'P)

; (function? (myfunc (+ 2 2) 5)) -> true
(define-macro (function?) 
    (catch
        (begin
            (when (= (length (args)) 0) (throw nil))
            (set '_v (args 0))
            (when (quote? _v) 
                (set '_v (eval _v))
                (when (null? _v) (throw nil)))
            (when (list? _v) (set '_v (_v 0)))
            (when (or (string? _v) (null? _v) (number? _v) (= 'true _v)) (throw nil))
            (when (symbol? _v)
                 (when (protected? _v) (throw true))
                 (set '_v (eval _v))
                 (when (null? _v) (throw nil))
                 (when (and (list? _v) (not (lambda? _v)) (not (macro? _v)))
                    (set '_v (_v 0))
                    (when (protected? _v) (throw true))
                    (set '_v (eval _v))))
            (if (or
                (lambda? _v)
                (protected? _v) ;if we need to count such forms like (println "...") or (+ 2 2)
                (macro? _v)) 
            (throw true) (throw nil)))
        '_res)
    _res)

(define (paired? el)
    (catch
        (begin
            (when (list? el)
                (when (= (length el) 2) (throw true)))
            (throw nil))
        'res)
    res)

(define (bind-vars al ctx)
    ;(println "bind-vars: " al)
    (when (null? ctx) (set 'ctx 'P))
    (set 'll (filter paired? al)) ; paired lists stay
    (set 'll (filter (fn(x) (if (symbol? (x 0)) true nil)) ll)) ; lists with first element as symbol stay
    (set 'nl (map (fn(x) (list (sym (term (x 0)) ctx) (eval (x 1)))) ll))
    (bind nl)) 
 
; pattern comments wrap the html code of pattern:
(define (start-comment pattern_name)
    (if MAIN:@comments
        (list (string "\n<!-- Start of " pattern_name " pattern -->") "" "" "")
         ""))

(define (end-comment pattern_name)
    (if MAIN:@comments
        (list (string "\n<!-- Start of " pattern_name " pattern -->") "" "" "")
         ""))

(define (append-buf l1 l2)
    (set 'buf (map (fn(_l1 _l2) (extend _l1 _l2)) l1 l2)))

; generate string: name1='value1' name2='value2' ...
(define (tagstr li)
    (set 'res "")
    (dolist (_x li)
        ;(println "inline.lsp: tagstr: _x: " _x ", (eval _x): " (eval _x))
        (set '_val (eval _x))
        (when (not (null? _val)) (extend res (string " " (term _x) "='" _val "'"))))
    res)

(context MAIN)
