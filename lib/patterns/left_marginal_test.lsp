
;; Testing 'Left marginal' pattern (p.39)
;
;<div id='s[0-9]+'><div id='s[0-9]'>Heading</div>text</div>
;
;   #s[0-9]+ { position:relative; margin-left: 200px; } 
;   #s[0-9]+ { position:absolute; left:-200px; top:0; margin:0; }
;
 
(load "lib/patterns/left_marginal.lsp")

(setf __html "" __css "")
(setf $1 nil $2 nil $3 nil $4 nil $5 nil $6 nil $7 nil $8 nil $9 nil)

;EXP:
(P:left-marginal (margin-left "200px") (t "Heading") (t "text"))

(assert-like __html "<div id='s[0-9]+'><div id='s[0-9]'>Heading</div>text</div>")
(set 'css_str " 
       #s[0-9]+ { position:relative; margin-left: 200px; } 
       #s[0-9]+ { position:absolute; left:-200px; top:0; margin:0; }
    ")
(assert-equal __css css_str)
