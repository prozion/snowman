;; testing inline

(load "lib/patterns/inline.lsp")
(load "lib/patterns/block.lsp")

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
(assert-equal __html "<span class='classname' id='idname'></span>")

(set '__html "")
(P:inline (class "classname") (id "idname") (t "hello"))
(assert-equal __html "<span class='classname' id='idname'>hello</span>")

(set '__html "" 'idname "idname6")
(P:inline (class (string "classname" (+ 2 2))) (id idname))
(assert-equal __html "<span class='classname4' id='idname6'></span>")

(set '__html "")
(P:inline (P:inline))
(assert-equal __html "<span><span></span></span>")

(set '__html "" 'classname "classname2" 'idname "idname2")
(P:inline (class "classname1") (id "idname1") (t "outer") (P:inline (class classname) (id idname) (t "inner")))
(assert-equal __html "<span class='classname1' id='idname1'>outer<span class='classname2' id='idname2'>inner</span></span>")

(set '__html "")
(P:inline (t "outer") (P:inline (t "inn") (P:inline (t "very inner")) (t "er")))
(assert-equal __html "<span>outer<span>inn<span>very inner</span>er</span></span>")

(set '__html "" 'txt "some text")
(P:inline (t txt))
(assert-equal __html "<span>some text</span>") 

(set '__html "" 'classname "classname2" 'idname "idname2" 'txt "some text")
(P:inline (class "classname1") (id "idname1") (t txt))
(assert-equal __html "<span class='classname1' id='idname1'>some text</span>")

(set '__html "" 'txt "some text")
(P:inline (t (string "this is " txt)) (P:inline) (t (+ 2 (* 2 2))) (P:block) (t "This is after the tag"))
(assert-equal __html "<span>this is some text<span></span>6<div></div>This is after the tag</span>") 


