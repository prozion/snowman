
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
(P:text-replacement (image "tests/files/heading2.jpg") (fallback-text "Heading 2"))

(assert-like __html "<div id='s[0-9]+'>Heading 2<span id='s[0-9]+'></span></div>")
(set 'css_str " 
       #s[0-9]+ { position:relative; width:250px; height:76px; overflow:hidden; } 
       #s[0-9]+ { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url('heading2.jpg') no-repeat; }
    ")
(assert-like __css css_str)
