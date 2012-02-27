;; 'Text replacement' pattern (p.38)

(load "lib/html.lsp")

;; args: '((image "heading_2.jpg") [(text "Heading 2")])
(define (text-replacement)

    (set 'image (eval (lookup 'image (args 0))))
    (set 'text (eval (lookup 'text (args 0))))
    (when (nil? text) (set 'text ""))    

    (absolute (list '(top "0px") '(left "0px") (list 'outer_text text))) ... ?

    (background-image (list (list 'image image)))

    ;; The idea how to combine two patterns into the higher pattern?

