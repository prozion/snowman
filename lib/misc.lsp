; Here are the helper functions

; all the generated names to ensure we have unique name for each class or id
(set '@gennames '())

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

; negate value written in string
(define (neg astr)
    (if (= (astr 0) "-") 
        (set 'res (1 astr))
        (set 'res (string "-" astr)))
res)

; initialize in the form: (setl '(a b c) '(1 2 3))
(define (setl vars values)
    (dolist (_x vars)
        (if (< $idx (length values))
            (set (sym _x (prefix _x)) (values $idx)))))

; initialize selected variables from the assoc-list
; (setla '(a (b 10) d) '((a 1) (b 2) (c 3) (d 4)))
(define (setla vars al)
    (println "misc.lsp: setla: vars: " vars ", al: " al)
    (dolist (_x vars)
        (when (list? _x) 
            (set '_val (eval (lookup (sym (term (_x 0))) al)))
            (if (and (nil? _val) (> (length _x) 1)) ; if no corr. value in assoc-list and default value is given for a key 
                (set (sym (_x 0) (prefix (_x 0))) (eval (_x 1)))
                (set (sym (_x 0) (prefix (_x 0))) _val)))
        (when (symbol? _x)
            (set (sym _x (prefix _x)) (eval (lookup (sym (term _x)) al))))))       

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
            (when (list? (args 0))
                ;(println "1")
                (set '_v (eval (args 0 0))))
            (when (quote? (args 0))
                ;(println "2")
                (set '_v ((eval (args 0)) 0)))
            (when (symbol? (args 0))
                ;(println "3")
                (set '_v (eval ((eval (args 0)) 0))))
            (set '_symable (not (find " " _v)))
            (set '_vv (if _symable (sym (term _v) (sym (term _v))) nil))
            (set '_v (eval _v) '_vv (eval _vv))
            (if (or
                (lambda? _v)
                (lambda? _vv)
                ; (protected? _v) if we need to count such forms like (println "...") or (+ 2 2)
                (macro? _v) 
                (macro? _vv)) 
            (throw true) (throw nil)))
        '_res)
        ;(println "misc.lsp: function: _v: " _v ", ?: " (macro? _v) "/" (lambda? _v))
        ;(println "misc.lsp: function: _vv: " _vv ", ?: " (macro? _vv) "/" (lambda? _vv))
    _res)

(define (bind-vars)
    (set 'ctx (args 1))
    (bind (map (fn(x) (list (sym (term (x 0)) ctx) (eval (x 1)))) (args 0))))
 
; pattern comments wrap the html code of pattern:
(define (start-comment pattern_name)
    (if MAIN:@comments
        (list (string "\n<!-- Start of " pattern_name " pattern -->") "" "" "")
         ""))

(define (end-comment pattern_name)
    (if MAIN:@comments
        (list (string "\n<!-- Start of " pattern_name " pattern -->") "" "" "")
         ""))

(define-macro (html)
    (dolist (_x (args))
        (extend MAIN:__html (eval _x))))

(define-macro (text)
    (MAIN:setla '(text file) (MAIN:assoc-list (args)))
    (when (and (> (length (args)) 0) (string? (args 0))) (html (args 0))) ; if argument is just a text (string)
    (when text (html (eval text)))
    (when (and file (file? file)) (html (read-file file))))


(define (append-buf l1 l2)
    (set 'buf (map (fn(_l1 _l2) (extend _l1 _l2)) l1 l2)))

(context MAIN)
