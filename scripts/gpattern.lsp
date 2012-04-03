#! /usr/bin/newlisp

(context 'G)

(set 'test_template {
;; Testing '%s' pattern (p.%s)
;
%s
;
%s
;
 
(load "lib/patterns/%s")

(setf __html "" __css "")
(setf $1 nil $2 nil $3 nil $4 nil $5 nil $6 nil $7 nil $8 nil $9 nil)

;EXP:
%s

(assert-like __html "%s")
(set 'css_str "%s")
(assert-equal __css css_str)
})

(set 'code_template {
;; '%s' pattern (p.%s)
;
%s
;
%s

(context 'P)

; %s
(define-macro (%s)
    (let (idname1 (genname) _txt (text-args (args)))
        (bind-vars (args))
        ; html:
        %s))

(context MAIN)
})

; helper functions:
(define (commentify str)
    (replace {^\s*\n} str "" 1) (replace {\n\s*$} str "" 1) ; remove leading \n 
    (replace "\t" str "") (replace "    " str "") ; remove tabulation
    (replace "\n" (append ";" str) "\n;"))

; (G:description 
;   (name "Absolute")
;   (page 37)
;   (example (P:absolute (top "100px") (left "20px") "Sized Absolute"))
;   (html {<div id='s[0-9]+'><span id='s[0-9]+'>Sized Absolute</span></div>})
;   (css { 
;       #s[0-9]+ { position:relative; } 
;       #s[0-9]+ { position:absolute; top:10px; left:20px; }
;   }) 
;   (expr (block (id idname1) (inline (id idname2) txt)))
;   (width "100px")
;   (items (list "Home" "Products" "About Us")))       
(define-macro (description)
    (catch
        (begin
            (bind (args))
            (when (null? name) (throw "Pattern name is not defined"))
            (when (not (and (directory? "lib/patterns") (directory? "tests"))) (throw "Can't find library or test directory!"))            
            (set 'function_name (replace { } (lower-case name) "_"))
            (set 'filename (string function_name ".lsp"))
            (set 'filepath (string "lib/patterns/" function_name ".lsp"))
            (set 'testfilepath (string "tests/" function_name "_test.lsp"))
            (if-not (or (file? filepath) (file? testfilepath))
                (begin
                    (write-file testfilepath (format test_template name (string page) (commentify html) (commentify css) filename (string example) html css))
                    (write-file filepath (format code_template name (string page) (commentify html) (commentify css) (string example) (replace "_" function_name "-") (string expr))))
                (throw (string "One of " function_name " files already exists!")))
        )
        'err)
    err)

; SCRIPT START
; $ scripts/gpattern.lsp descriptions/dropdown_menu.lsp
(catch 
    (eval-string (read-file (main-args 2)))
    'err)

(println err)
(exit)
