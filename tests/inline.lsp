;; testing inline

(load "lib/patterns/inline.lsp")

(println "Testing inline.lsp")

(set '__html "")
(P:inline)
(assert-equal __html "<span></span>")

(set '__html "")
(P:inline (class "classname"))
(assert-equal __html "<span class='classname'></span>")

(set '__html "")
(P:inline (class "classname") (id "idname"))
(assert-equal __html "<span class='classname' id='idname'></span>")

;(set '__html "")
;(P:inline (class "classname") (id "idname") (string "hello"))
;(assert-equal __html "<span class='classname' id='idname'>hello</span>")

(set '__html "")
(P:inline (class "classname") (id "idname") "hello")
(assert-equal __html "<span class='classname' id='idname'>hello</span>")

(set '__html "" 'idname "idname6")
(P:inline (class (string "classname" (+ 2 2))) (id idname))
(assert-equal __html "<span class='classname4' id='idname6'></span>")

(set '__html "")
(P:inline (P: inline))
(assert-equal __html "<span><span></span></span>")

(set '__html "" 'classname "classname2" 'idname "idname2")
(P:inline (class "classname1") (id "idname1") "outer" (P:inline (class classname) (id idname) "inner"))
(assert-equal __html "<span class='classname1' id='idname1'>outer<span class='classname2' id='idname2'>inner</span></span>")

(set '__html "")
(P:inline "outer" (P:inline (P:inline "very inner") "inner"))
(assert-equal __html "<span>outer<span>inner<span>very inner</span></span></span>")
