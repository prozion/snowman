
;; Testing 'Absolute2' pattern (p.37)
;
;<div id='s[0-9]+'><span id='s[0-9]+'>Sized Absolute</span></div>
;
;#s[0-9]+ { position:relative; } 
;#s[0-9]+ { position:absolute; top:10px; left:20px; }
;
 
(load "lib/patterns/absolute2.lsp")

(setf __html "" __css "" $1 nil)

;EXP:
(P:absolute (top "100px") (left "20px") "Sized Absolute")

(assert-like __html "<div id='s[0-9]+'><span id='s[0-9]+'>Sized Absolute</span></div>")
(set 'css_str " 
        #s[0-9]+ { position:relative; } 
        #s[0-9]+ { position:absolute; top:10px; left:20px; }
   ")
(assert-equal __css css_str)
