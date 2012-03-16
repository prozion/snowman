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

(load "lib/misc.lsp")
(load "lib/css.lsp")

; (base (@dir "tmp") (P:background-image (image "image.jpg")))
(define-macro (base)
    (set '__html "")
    (set '__css "")
    (set '__js "")
    ;(set '__img nil)

    (set 'BASE_HTML_FILE "templates/html/base.thtml")
    (set 'RESET_CSS_FILE "templates/css/reset.tcss")
    (set '@gennames '())
    (set '@block "div")
    (set '@inline "span")
    (set '@comments true) ; comments on/off    
    (bind
        '((@dir "new_template")
          (@imagedir "images")
          (@stylesheet "styles.css")
          (@js_styles "functions.js")
          (@html_file "index.html")
          (@lang "en")
          (@title "Snowman generator")))
    ; read (key value)'s from the body of base, that are not functions         
            
    (bind (clean P:function? (clean string? (args))))

    (extend __css (read-file RESET_CSS_FILE))

    ; eval cycle
    (map eval (filter P:function? (args)))
                
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
