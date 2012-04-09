# Testing 'Marginal graphic dropcap' pattern (p.40)
# This pattern is given in the end of book's introduction as an example of compound pattern. It is assembled from the previous, more primitive patterns. Here I try to figure out the full picture of breaking up into the patterns, in up-down way.

#  Final code of the pattern in the book looks like this:
#  html:
; <div id="idname1"><span id="idname2">M<span></span></span>arginal Graphic Dropcap. The letter M has been covered by the dropcap image. Screen readers read the text and visual users see the image. If the browser cannot display the dropcap image, the text becomes visible.</div>
# css:
; #idname1 { position:relative; margin-left:150px }
; #idname2 { position:absolute; width:120px; heigth:90px; left:-120px; top:0 }
; #idname2 span { position:absolute; width:120px; height:90px; margin:0; left:0; top:0; background:url("m.jpg") no-repeat; }

# Now my view, how it should work in snowman

# Call:
; (P:marginal-graphic-dropcap (image-margin "30px") (image "resources/tests/files/m.jpg") (fallback-text "M") "arginal Graphic Dropcap.")

# Implementation:
; (P:left-marginal 
;   (margin-left <<image_width>> + <<margin_from_image>>) 
;   (t (P:text-replacement (image "resources/tests/files/m.jpg") (fallback-text "M")))
;   (t "arginal Graphic Dropcap"))

# P:left-marginal implementation:
; (P:block (margin-left <<margin_left>>) (P:inline <<last-1>>) (t <<last>>))

# P:text-replacement implementation:
; (P:inline (t "M")
;   (P:background-image (image "resources/tests/files/m.jpg")))

# P:background-image implementation:
; (P:inline (width <<image_width>>) (height <<image_height>>))

# P:inline implementation:
; <span id="idname1"><<text>></span> -> __html
; #idname1 {<<properties>>} -> __css

(load "lib/patterns/marginal_graphic_dropcap.lsp")

(setf __html "" __css "") 
(setf $1 nil $2 nil $3 nil)

; <div id="idname1"><span id="idname2">M<span id="idname3"></span></span>arginal Graphic Dropcap.</div>

(P:marginal-graphic-dropcap (image-margin "30px") (image "resources/tests/files/m.jpg") (fallback-text "M") (t "arginal Graphic Dropcap."))

(assert-like __html (format "<div id='(%s)'><div id='(%s)'><span id='(%s)'>M<span id='(%s)'></span></span></div>arginal Graphic Dropcap.</div>" "s[0-9]+" "s[0-9]+" "s[0-9]+" "s[0-9]+"))
(setf idname1 (string "#" $1) idname2 (string "#" $2) idname3 (string "#" $3) idname4 (string "#" $4))
(set 'css_str1 (format "%s { position:relative; margin-left:140px; }" idname1))
(set 'css_str2 (format "%s { position:absolute; left:-140px; top:0; margin:0; }" idname2))
(set 'css_str3 (format "%s { position:relative; width:110px; height:90px; overflow:hidden; }" idname3))
(set 'css_str4 (format "%s { position:absolute; left:0; top:0; margin:0; width:110px; height:90px; background:url\\('%s/m.jpg'\\) no-repeat; }" idname4 @imagedir))


(assert-like __css css_str1)
(assert-like __css css_str2)
(assert-like __css css_str3)
(assert-like __css css_str4)





