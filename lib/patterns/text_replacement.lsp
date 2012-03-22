;; 'Text replacement' pattern (p.38)

; <h2 id="h2">Heading 2 <span></span></h2>
;
; #h2 { position:relative; width:250px; height:76px; overflow:hidden; }
; #h2 span { position:absolute; width:250px; height:76px; left:0px; top:0px; background:url("heading.jpg") no-repeat; }

(load "lib/misc.lsp")
(load "lib/css.lsp")
(load "lib/img/imagemagick.lsp")

(context 'P)

(define (text-replacement)
    (set 'PNAME "Text replacement"))

(context MAIN)
