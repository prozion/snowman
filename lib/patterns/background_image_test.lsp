; (P:background-image (image "heading2.jpg"))

; <span></span>
;
; span { background:url('heading2.jpg') no-repeat; width:250px; height:76px; }

(load "lib/patterns/block.lsp")
(new Class 'Img) (load "lib/patterns/background_image.lsp")

(setf __html "" __css "" @dir "testdir" @imagedir "image") 

(setf $1 nil)
(catch
    (begin
        (make-dir @dir)
        (make-dir (format "%s/%s" @dir @imagedir))))

; EXP:
(P:background-image (image "resources/tests/files/heading2.jpg"))

(assert-like __html "<span id='(s[0-9]+)'></span>")
(set 'idname (string "#" $1))
;; important! there is \n in the end of css rule, set it here too!
(set 'css_str (string idname " { margin:0; width:250px; height:76px; background:url('" @imagedir "/heading2.jpg') no-repeat; }\n"))
(assert-equal __css css_str)
(assert-true (file? (format "%s/%s/%s" @dir @imagedir "heading2.jpg")))

(catch
    (begin
        (delete-file (format "%s/%s/%s" @dir @imagedir "heading2.jpg"))
        (remove-dir (format "%s/%s" @dir @imagedir))
        (remove-dir @dir)))




