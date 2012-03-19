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
