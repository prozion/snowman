(load "lib/misc.lsp")

(context 'Html)

(define (tag tagname parameters body)
    (set 'tag_parameters "")
    (dolist (x (args))
        (extend tag_parameters (string (x 0)) {="} (string (x 1)) {"})
    (string {<} tagname { } tag_parameters {>} body {</} tagname {>})))

(define-macro (div params body)
    (tag "div" (eval params) (eval body)))

(define-macro (span params body)
    (tag "span" (eval params) (eval body)))

(define-macro (a params body)
    (tag "a" (eval params) (eval body)))

(define-macro (p params body)
    (tag "p" (eval params) (eval body)))

(define-macro (ul params body)
    (tag "ul" (eval params) (eval body)))

(define-macro (ol params body)
    (tag "ol" (eval params) (eval body)))

(define-macro (li params body)
    (tag "li" (eval params) (eval body)))

(define-macro (h2 params body)
    (tag "h2" (eval params) (eval body)))

(context MAIN)
