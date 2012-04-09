(load "lib/misc.lsp")

;; (P:block (class classname) (css.top "10px") (t "some content"))
(context 'P)
(define-macro (block)
    (let (arglst nil class nil idname (genname) css_list '() t "")
      (set 'arglst (map unquote (args))) ; expand the variable
        (unless (null? arglst)
            (if (list? (arglst 0 0)) (set 'arglst (arglst 0)))) ; in the case of passed-in variable, remove extra brackets after expanding
        (map set '(class t) (bindl '("class" "t") arglst))
        (set 'css_list (css-list arglst))
        (unless (null? css_list) 
            (extend __css (format "#%s {" idname))
            (dolist (x css_list)
                (find "css\.(.+)$" (string (x 0)) 0) 
                (extend __css (format " %s:%s;" (string $1) (string (x 1)))))
            (extend __css " }\n"))
        (extend __html (format "<%s%s%s>" @block (if class (format " class='%s'" class) "") (if css_list (format " id='%s'" idname) "")))
        (dolist (x arglst)
            (when (and (list? x) (not (null? x)))
                (cond
                    ((= (term (x 0)) "t") (extend __html (string (eval (x 1)))))
                    ((function? (x 0)) (eval x)))))
        (extend __html (string "</" @block ">"))))

(context MAIN)


