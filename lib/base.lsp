#!/usr/bin/newlisp

(context 'Base)

(set 'CSS_FILE "styles.css")
(set 'HTML_FILE "index.html")

(set 'BASE_HTML_FILE "templates/html/base.thtml")
(set 'BODY_HTML_FILE "templates/html/sample_body.thtml")
(set 'RESET_CSS_FILE "templates/css/reset.tcss")
(set 'LANG "en")
(set 'TITLE "Testing")

(define (build-html)
    (set 'template (read-file BASE_HTML_FILE))
    (set 'body (read-file BODY_HTML_FILE))
    (println (! "pwd"))
    (replace "{LANG}" template LANG 1)
    (replace "{TITLE}" template TITLE 1)
    (replace "{CSS_FILE}" template CSS_FILE 1)
    (replace "{SELF_CODE}" body (read-file "/home/denis/projects/snowman/lib/base.lsp") 1)
    (replace "{BODY}" template body 1)
    template)
(define (build-css)
    (set 'template (read-file RESET_CSS_FILE))
    template)

(define (generate-template)
    (make-dir dir)
    (write-file (string dir "/" CSS_FILE) (build-css))
    (write-file (string dir "/" HTML_FILE) (build-html))) 

(define (init)
    (set 'arg_assoc_list (args 0))
    (set 'aal arg_assoc_list)
    (set 'dir (eval (lookup 'dir aal))))

(context MAIN)
