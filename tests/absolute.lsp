;; Testing 'Absolute' pattern (p.37)
; 
; <div id="s1">
;   <span id="s2">Sized Absolute</span>
; </div>
;
; .s1 { position:relative; }
; .s2 { position:absolute; top:10px; left:20px; } 

; (P:absolute (top "10px") (left "20px") "Sized Absolute")

; Remark: inside the pattern it is desirable to combine block and inline patterns
; as e.g.
; (block (id "s1") (inline (id "s2") "Sized Absolute"))
; the real css then will look like
; .c1 ...
; .c1 <inline_tag> ...

(load "lib/patterns/absolute.lsp")

(setf __html "" __css "" $1 nil)

; EXP:
(P:absolute (top "10px") (left "20px") "Sized Absolute")

(assert-like __html "<div id='(s[0-9]+)'><span id='(s[0-9]+)'>Sized Absolute</span></div>")
(setf idname1 (string "#" $1) idname2 (string "#" $2)) 
(set 'css_str (format "%s { position:relative; }\n" idname1))
(set 'css_str (append css_str (format "%s { position:absolute; top:10px; left:20px; }\n" idname2)))
(assert-equal __css css_str)




