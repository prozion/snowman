;; testing block

(load "lib/patterns/block.lsp")

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

(set '__html "" 'txt "some text")
(P:block txt)
(assert-equal __html "<div>some text</div>") 

(set '__html "" 'classname "classname2" 'idname "idname2" 'txt "some text")
(P:block (class "classname1") (id "idname1") txt)
(assert-equal __html "<div class='classname1' id='idname1'>some text</div>")

(set '__html "")
(P:block "outer" (P:block (P:block "very inner") "inner"))
(assert-equal __html "<div>outer<div>inner<div>very inner</div></div></div>")

(set '__html "")
(P:block (P:block txt))
(assert-equal __html "<div><div>some text</div></div>")



(load "lib/patterns/inline.lsp")

(set '__html "")
(P:block (id "id1") (P:inline (id "id2") "inner"))
(assert-equal __html "<div id='id1'><span id='id2'>inner</span></div>")

(set '__html "")
(P:block "outer" (P:inline "inner"))
(assert-equal __html "<div>outer<span>inner</span></div>")

(set '__html "")
(P:block (class "c1") "outer" (P:inline (class "c2") "inner"))
(assert-equal __html "<div class='c1'>outer<span class='c2'>inner</span></div>")

(set '__html "")
(P:block (P:inline txt))
(assert-equal __html "<div><span>some text</span></div>")

(setf __html "" idname1 "id1" idname2 "id2" txt "some text")
(P:block (id idname1) (P:inline (id idname2) txt))
(assert-equal __html "<div id='id1'><span id='id2'>some text</span></div>")




