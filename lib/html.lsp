(load "lib/misc.lsp")

(context 'tag)
(define-macro (tag:tag tagname parameters body)
    (set 'tag_parameters "")
    (set 'pars (eval parameters))
    (dolist (x pars)
        (extend tag_parameters (string (term (x 0)) {="} (string (x 1)) {"})))
    (set 'res (string {<} tagname { } tag_parameters {>} (eval body) {</} tagname {>}))
    res)
(context MAIN)

(context 'Html)
(define-macro (block params body)
    (set 'params (eval params))
    (set 'body (eval body))
    (tag @default_block_element params (eval body)))

(define-macro (inline params body)
    (tag @default_inline_element (eval params) (eval body)))

(define-macro (diV params body)
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
