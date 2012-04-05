(G:description 
    (name "Text replacement")
    (page 38)
    (example (P:text-replacement (image "tests/files/heading2.jpg") (fallback-text "Heading 2")))
    (html {<div id='s[0-9]+'>Heading 2<span id='s[0-9]+'></span></div>})
    (css { 
       #s[0-9]+ { position:relative; width:250px; height:76px; overflow:hidden; } 
       #s[0-9]+ { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url('heading2.jpg') no-repeat; }
    }) 
    (expr (P:inline "M"
        (P:background-image (image "tests/files/m.jpg")))))

