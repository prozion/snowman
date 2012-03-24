 (G:description 
   (name "Absolute2")
   (page 37)
   (example (P:absolute (top "100px") (left "20px") "Sized Absolute"))
   (html {<div id='s[0-9]+'><span id='s[0-9]+'>Sized Absolute</span></div>})
   (css { 
        #s[0-9]+ { position:relative; } 
        #s[0-9]+ { position:absolute; top:10px; left:20px; }
   }) 
   (expr (block (id idname1) (inline (id idname2) txt)))
   (width "100px")
   (items (list "Home" "Products" "About Us")))       

