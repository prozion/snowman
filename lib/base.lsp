#!/usr/bin/newlisp

;; Here is an overall function 'base', that makes frames for html, css and javascript, creates generated template directory structure and calls underlied building blocks (design patterns).

;; Suggested structure of generated template :
;;
;; <template_folder>/
;; |___images/
;;     |___background.png
;;     |___image1.jpg
;;     ...
;; |___styles.css
;; |___functions.js
;; |___index.html

(new Class 'Img)

(load "lib/misc.lsp")
(load "lib/css.lsp")

; global constants
(set '@block "div") (constant (global '@block))
(set '@inline "span") (constant (global '@inline))
(set (global '__html) "")
(set (global '__css) "")
(set (global '__js) "")

(set (global '@imagedir) "images")
(set (global '@stylesheet) "styles.css")
(set (global '@javascript) "functions.js")
(set (global '@dir) "_new_template")
(set (global '@lang) "en")
(set (global '@html_file) "index.html")
(set (global '@title) "Snowman generator")

; (base (@dir "tmp") (P:background-image (image "image.jpg")))
(define-macro (base)    
  (set 'arglst (map P:unquote (args))) ; expand the variable
    (unless (null? arglst)
        (if (list? (arglst 0 0)) (set 'arglst (arglst 0)))) ; in the case of passed-in variable, remove extra brackets after expanding

    (constant 'BASE_HTML_FILE "resources/templates/html/base.html")
    (constant 'RESET_CSS_FILE "resources/templates/css/reset.css")
    (set '@gennames '())

    ; read (key value)'s from the body of base, that are not functions         
    (bind (clean P:function? (clean string? arglst)))

    (extend __css (read-file RESET_CSS_FILE))

    (set '@dir (string ((exec "echo $HOME") 0) "/" @dir))

    ; eval cycle
    (map eval (filter P:function? arglst))
                
    (set 'html_base (read-file BASE_HTML_FILE))
    (replace "\\[LANG\\]" html_base @lang 1)
    (replace "\\[TITLE\\]" html_base @title 1)
    (replace "\\[CSS_FILE\\]" html_base @stylesheet 1)
    (set 'html_res (replace "\\[BODY\\]" html_base __html 1))

    (make-dir @dir)
    (make-dir (string @dir "/" @imagedir))
    ;(dolist (i __img)
    ;   (copy-file (i 0) (string @dir "/" (i 1))))
    
    (write-file (string @dir "/" @html_file) html_res)
    (write-file (string @dir "/" @stylesheet) __css)
    ;(write-file (string @dir "/" @js_file) __js)

    (exit)) 
