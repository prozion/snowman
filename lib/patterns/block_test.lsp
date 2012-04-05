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
(assert-equal __html "<div class='classname' id='idname'></div>")

(set '__html "" 'idname "idname6")
(P:block (class (string "classname" (+ 2 2))) (id idname))
(assert-equal __html "<div class='classname4' id='idname6'></div>")

(set '__html "")
(P:block (P: block))
(assert-equal __html "<div><div></div></div>")

(set '__html "" 'classname "classname2" 'idname "idname2")
(P:block (class "classname1") (id "idname1") (t "outer") (P:block (class classname) (id idname) (t "inner")))
(assert-equal __html "<div class='classname1' id='idname1'>outer<div class='classname2' id='idname2'>inner</div></div>")

(set '__html "" 'txt "some text")
(P:block (t txt))
(assert-equal __html "<div>some text</div>") 

(set '__html "" 'txt "some text")
(P:block txt)
(assert-equal __html "<div></div>") 

(set '__html "" 'classname "classname2" 'idname "idname2" 'txt "some text")
(P:block (class "classname1") (id "idname1") (t txt))
(assert-equal __html "<div class='classname1' id='idname1'>some text</div>")

(set '__html "")
(P:block (t "outer") (P:block (P:block (t "very inner")) (t "inner")))
(assert-equal __html "<div>outer<div><div>very inner</div>inner</div></div>")

(set '__html "")
(P:block (P:block (t txt)))
(assert-equal __html "<div><div>some text</div></div>")

(load "lib/patterns/inline.lsp")

(set '__html "")
(P:block (id "id1") (P:inline (id "id2") (t "inner")))
(assert-equal __html "<div id='id1'><span id='id2'>inner</span></div>")

(set '__html "")
(P:block (t "outer") (P:inline (t "inner")))
(assert-equal __html "<div>outer<span>inner</span></div>")

(set '__html "")
(P:block (class "c1") (t "outer") (P:inline (class "c2") (t "inner")))
(assert-equal __html "<div class='c1'>outer<span class='c2'>inner</span></div>")

(set '__html "")
(P:block (P:inline (t txt)))
(assert-equal __html "<div><span>some text</span></div>")

(setf __html "" idname1 "id1" idname2 "id2" txt "some text")
(P:block (id idname1) (P:inline (id idname2) (t txt)))
(assert-equal __html "<div id='id1'><span id='id2'>some text</span></div>")

(set '__html "" 'txt "some text")
(P:block (t (string "this is " txt)) (P:inline) (t (+ 2 (* 2 2))) (P:block) (t "This is after the tag"))
(assert-equal __html "<div>this is some text<span></span>6<div></div>This is after the tag</div>") 




