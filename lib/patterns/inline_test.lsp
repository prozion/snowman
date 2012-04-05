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
(P:inline (class "classname") "hello")
(assert-equal __html "<span class='classname'></span>")

(set '__html "")
(P:inline (class "classname") (t "hello"))
(assert-equal __html "<span class='classname'>hello</span>")

(set '__html "")
(P:inline (class (string "classname" (+ 2 2))))
(assert-equal __html "<span class='classname4'></span>")

(set '__html "")
(P:inline (P:inline))
(assert-equal __html "<span><span></span></span>")

(set '__html "" 'classname "classname2")
(P:inline (class "classname1") (t "outer") (P:inline (class classname) (t "inner")))
(assert-equal __html "<span class='classname1'>outer<span class='classname2'>inner</span></span>")

(set '__html "")
(P:inline (t "outer") (P:inline (t "inn") (P:inline (t "very inner")) (t "er")))
(assert-equal __html "<span>outer<span>inn<span>very inner</span>er</span></span>")

(set '__html "" 'txt "some text")
(P:inline (t txt))
(assert-equal __html "<span>some text</span>") 

(set '__html "" 'txt "some text")
(P:inline txt)
(assert-equal __html "<span></span>") 

(set '__html "" 'classname "classname2" 'txt "some text")
(P:inline (class "classname1") (t txt))
(assert-equal __html "<span class='classname1'>some text</span>")

(set '__html "" 'txt "some text")
(P:inline (t (string "this is " txt)) (P:inline) (t (+ 2 (* 2 2))) (P:block) (t "This is after the tag"))
(assert-equal __html "<span>this is some text<span></span>6<div></div>This is after the tag</span>") 

(set '__html "" '__css "")
(P:inline (css.margin "10px 20px 30px 40px") (css.padding "10 30px"))
(assert-like __html "<span id='(s[0-9]+)'></span>") 
(assert-like __css "#s([0-9])+ { margin:10px 20px 30px 40px; padding:10 30px; }\n")




