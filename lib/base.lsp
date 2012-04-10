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

(load "lib/globals.lsp")
(load "lib/misc.lsp")

; (base (@dir "tmp") (P:background-image (image "image.jpg")))
(define-macro (base)    
  (set 'arglst (map P:unquote (args))) ; expand the variable
    (unless (null? arglst)
        (if (list? (arglst 0 0)) (set 'arglst (arglst 0)))) ; in the case of passed-in variable, remove extra brackets after expanding

    (set '@gennames '())

    ; read (key value)'s from the body of base, that are not functions         
    (bind (clean P:function? (clean string? arglst)))

    (extend __css (read-file RESET_CSS_FILE))

    ; full path:
    (unless (= (first @dir) "/") (set '@dir (append (env "HOME") "/" @dir)))

    ; eval cycle
    (map eval (filter P:function? arglst))
                
    (set 'document_type {html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"})

    (set 'html_base (read-file BASE_HTML_FILE))
    (set 'html_res (format html_base document_type @lang @lang @title @stylesheet __html))

    (make-dir @dir)
    (make-dir (string @dir "/" @imagedir))
    ;(dolist (i __img)
    ;   (copy-file (i 0) (string @dir "/" (i 1))))
    
    (write-file (string @dir "/" @html_file) html_res)
    (write-file (string @dir "/" @stylesheet) __css)
    ;(write-file (string @dir "/" @js_file) __js)

    (exit)) 
