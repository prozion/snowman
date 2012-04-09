
;; Testing 'Text replacement' pattern (p.38)
;
;<div id='s[0-9]+'>Heading 2<span id='s[0-9]+'></span></div>
;
;   #s[0-9]+ { position:relative; width:250px; height:76px; overflow:hidden; } 
;   #s[0-9]+ { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url('heading2.jpg') no-repeat; }
;
 
(load "lib/patterns/text_replacement.lsp")

(setf __html "" __css "")
(setf $1 nil $2 nil $3 nil $4 nil $5 nil $6 nil $7 nil $8 nil $9 nil)

;EXP:
(P:text-replacement (image "resources/tests/files/heading2.jpg") (fallback-text "Heading 2"))

(assert-like __html "<span id='(s[0-9]+)'>Heading 2<span id='(s[0-9]+)'></span></span>")
(set 'css_str (string
       "#" $1 " { position:relative; width:250px; height:76px; overflow:hidden; }\n" 
       "#" $2 " { position:absolute; left:0; top:0; margin:0; width:250px; height:76px; background:url('" @imagedir "/heading2.jpg') no-repeat; }\n"))

;(map (fn(x y) (println x " " y)) (reverse (explode __css)) (reverse (explode css_str)))
(assert-equal __css css_str)
