(G:description 
    (name "Left marginal")
    (page 39)
    (example (P:left-marginal (margin-left "200px") (t "Heading") (t "text")))
    (html {<div id='s[0-9]+'><div id='s[0-9]'>Heading</div>text</div>})
    (css { 
       #s[0-9]+ { position:relative; margin-left: 200px; } 
       #s[0-9]+ { position:absolute; left:-200px; top:0; margin:0; }
    }) 
    (expr (P:block (margin-left <<margin_left>>) (P:inline <<last-1>>) (t <<last>>))))

