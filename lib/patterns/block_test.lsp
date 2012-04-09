;; testing block

(load "lib/patterns/block.lsp")

(set '__html "")
(P:block)
(assert-equal __html "<div></div>")

(set '__html "")
(P:block (class "classname"))
(assert-equal __html "<div class='classname'></div>")

(set '__html "")
(P:block (class "classname"))
(assert-equal __html "<div class='classname'></div>")

(set '__html "")
(P:block (class "classname") "hello")
(assert-equal __html "<div class='classname'></div>")

(set '__html "")
(P:block (class (string "classname" (+ 2 2))))
(assert-equal __html "<div class='classname4'></div>")

(set '__html "")
(P:block (P: block))
(assert-equal __html "<div><div></div></div>")

(set '__html "" 'classname "classname2")
(P:block (class "classname1") (t "outer") (P:block (class classname) (t "inner")))
(assert-equal __html "<div class='classname1'>outer<div class='classname2'>inner</div></div>")

(set '__html "" 'txt "some text")
(P:block (t txt))
(assert-equal __html "<div>some text</div>") 

(set '__html "" 'txt "some text")
(P:block txt)
(assert-equal __html "<div></div>") 

(set '__html "" 'classname "classname2" 'txt "some text")
(P:block (class "classname1") (t txt))
(assert-equal __html "<div class='classname1'>some text</div>")

(set '__html "")
(P:block (t "outer") (P:block (P:block (t "very inner")) (t "inner")))
(assert-equal __html "<div>outer<div><div>very inner</div>inner</div></div>")

(set '__html "")
(P:block (P:block (t txt)))
(assert-equal __html "<div><div>some text</div></div>")

(load "lib/patterns/inline.lsp")

(set '__html "")
(P:block (class "class1") (P:inline (class "class2") (t "inner")))
(assert-equal __html "<div class='class1'><span class='class2'>inner</span></div>")

(set '__html "")
(P:block (t "outer") (P:inline (t "inner")))
(assert-equal __html "<div>outer<span>inner</span></div>")

(set '__html "")
(P:block (P:inline (t txt)))
(assert-equal __html "<div><span>some text</span></div>")

(set '__html "" 'txt "some text")
(P:block (t (string "this is " txt)) (P:inline) (t (+ 2 (* 2 2))) (P:block) (t "This is after the tag"))
(assert-equal __html "<div>this is some text<span></span>6<div></div>This is after the tag</div>") 

(set '__html "" '__css "")
(P:block (css.margin "10px 20px 30px 40px") (css.padding "10 30px"))
(assert-like __html "<div id='(s[0-9]+)'></div>") 
(assert-like __css "#s([0-9])+ { margin:10px 20px 30px 40px; padding:10 30px; }\n")

(set '__html "" '__css "" 'padding "10 10" 'margin '(string (* 10 2) " " "20px"))
(P:block (css.margin margin) (css.padding padding))
(assert-like __html "<div id='(s[0-9]+)'></div>") 
(assert-like __css "#s([0-9])+ { margin:20 20px; padding:10 10; }\n")

(set '__html "" '__css "" 'classname "classname2" 'padding "30px")
(set 'expr '((css.margin "10px") (css.padding padding) (class "classname1") (t "outer") (P:inline (class classname) (t "inner"))))
(P:block expr)
(assert-like __html "<div class='classname1' id='(s[0-9]+)'>outer<span class='classname2'>inner</span></div>")
(assert-like __css  "#s[0-9]+ { margin:10px; padding:30px; }\n")
