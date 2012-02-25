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

(define (get-by-key key assoc_list default_value)
    (set 'value (lookup key (eval assoc_list)))
    (if (nil? default_value) (set 'default_value ""))
    (if (nil? value) (set 'value default_value))
    value)

;; '((dir "new_template") (imagedir "images") (stylesheet "styles.css") (javascript "functions.js") (html "index.html") (lang "en") (title "Testing"))
(define-macro (base)

    (set 'param_assoc (args 0)) ;; parameters assoc-list
        
    (set '@dir (get-by-key 'dir param_assoc "new_template")) 
    (set '@imagedir (get-by-key 'imagedir param_assoc "images")) 
    (set '@css_file (get-by-key 'stylesheet param_assoc "styles.css")) 
    (set '@js_file (get-by-key 'javascript param_assoc "functions.js")) 
    (set '@html_file (get-by-key 'html param_assoc "index.html")) 
    (set '@lang (get-by-key 'lang param_assoc "en")) 
    (set '@title (get-by-key 'title param_assoc "Snowman generator")) 

    (set '__html "")
    (set '__css "")
    (set '__js "")
    (set '__images '())

    (set 'BASE_HTML_FILE "templates/html/base.thtml")
    (set 'RESET_CSS_FILE "templates/css/reset.tcss")
    (extend __css (read-file RESET_CSS_FILE))

    (dolist (pattern (rest (args)))
        (println pattern)
        (eval pattern))

    (println "@lang: " @lang) 
    (println "base.lsp: __html: " __html)

    (set 'html_base (read-file BASE_HTML_FILE))
    (println "base.lsp: html_base 1:" html_base)
    (replace "\\[LANG\\]" html_base @lang 1)
    (println "base.lsp: html_base 2:" html_base)
    (replace "\\[TITLE\\]" html_base @title 1)
    (println "base.lsp: html_base 3:" html_base)
    (replace "\\[CSS_FILE\\]" html_base @css_file 1)
    (println "base.lsp: html_base 4:" html_base)
    (set 'html_res (replace "\\[BODY\\]" html_base __html 1))
    (println "base.lsp: html_res: " html_res)

    (make-dir @dir)
    (make-dir (string @dir "/" @imagedir))
    (write-file (string @dir "/" @html_file) html_res)
    (write-file (string @dir "/" @css_file) __css)
    (write-file (string @dir "/" @js_file) __js)

    (exit)) 
