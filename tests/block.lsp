;; testing block

(load "lib/patterns/block.lsp")

(println "Testing block.lsp")

(set '__html "")
(P:block)
(assert-equal __html "<div></div>")

(set '__html "")
(P:block (class "classname"))
(assert-equal __html "<div class='classname'></div>")

(set '__html "")
(P:block (class "classname") (id "idname"))
(assert-equal __html "<div class='classname' id='idname'></div>")

;(set '__html "")
;(P:block (class "classname") (id "idname") (string "hello"))
;(assert-equal __html "<div class='classname' id='idname'>hello</div>")

(set '__html "")
(P:block (class "classname") (id "idname") "hello")
(assert-equal __html "<div class='classname' id='idname'>hello</div>")

(set '__html "" 'idname "idname6")
(P:block (class (string "classname" (+ 2 2))) (id idname))
(assert-equal __html "<div class='classname4' id='idname6'></div>")

(set '__html "")
(P:block (P: block))
(assert-equal __html "<div><div></div></div>")

(set '__html "" 'classname "classname2" 'idname "idname2")
(P:block (class "classname1") (id "idname1") "outer" (P:block (class classname) (id idname) "inner"))
(assert-equal __html "<div class='classname1' id='idname1'>outer<div class='classname2' id='idname2'>inner</div></div>")

(set '__html "")
(P:block "outer" (P:block (P:block "very inner") "inner"))
(assert-equal __html "<div>outer<div>inner<div>very inner</div></div></div>")


(load "lib/patterns/inline.lsp")

(set '__html "")
(P:block "outer" (P:inline "inner"))
(assert-equal __html "<div>outer<span>inner</span></div>")
