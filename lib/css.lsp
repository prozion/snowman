(load "lib/misc.lsp")

(context 'Css)

(set 'parameters '("background" "width" "height"))

(define (make-str assoc_list)
    (set 'res " ")
    (dolist (x assoc_list)
        (set 'value (x 1))
        (set 'key (term (x 0)))
        ;; exceptions
        (if (= key "background-image") (set 'value (string "url('" value "')")))
        ;; add property
        (extend res (string key ":" value "; ")))
    res)

(define (. str) (string "." str)) (set 'class .) ;; synonim for .
(define (id str) (string "#" str))
(define (-> str) (string ">" str))
(define (pseudo str) (string ":" str))
(define (block) MAIN:@default_block_element) 
(define (inline) MAIN:@default_inline_element)

;; (selector "h1" (. "myclass1") (id "myid2) "a" (pseudo "hover"))
(define-macro (selector)
    (set 'res "")
    (dolist (x (args))
        (if-not (or (empty? res) (= (x 0) 'pseudo)) (extend res " "))
        (if (list? x) (extend res (eval x)))
        (if (string? x) (extend res (string x " "))))
    res)

(define (rule selector_str assoc_list) 
    (set 'res (string selector_str " {" (make-str assoc_list) "}\n"))
    res)


(context MAIN)
