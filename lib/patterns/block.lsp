(load "lib/misc.lsp")

;; (P:block (class classname) (css.top "10px") (t "some content"))
(context 'P)
(define-macro (block)
    (let (class nil idname (genname) css_list '() t "")
        (bind-vars (clean function? (args)) (prefix '_))
        (set 'css_list (filter (fn(x) (find "css\.(.+)$" (string (x 0)) 0)) (filter list? (args))))
        (unless (null? css_list) 
            (extend __css (format "#%s {" idname))
            (dolist (x css_list)
                (find "css\.(.+)$" (string (x 0)) 0) 
                (extend __css (format " %s:%s;" (string $1) (string (x 1)))))
            (extend __css " }\n"))
        (extend __html (format "<%s%s%s>" @block (if class (format " class='%s'" class) "") (if css_list (format " id='%s'" idname) "")))
        (dolist (x (args))
            (when (and (list? x) (not (null? x)))
                (cond
                    ((= (term (x 0)) "t") (extend __html (string (eval (x 1)))))
                    ((function? (x 0)) (eval x)))))
        (extend __html (string "</" @block ">"))))

(context MAIN)

