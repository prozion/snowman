; (P:background-image (image "heading2.jpg"))

; <div></div>
;
; div { background:url('heading2.jpg') no-repeat; width:250px; height:76px; }


(load "lib/patterns/block.lsp")
(new Class 'Img) (load "lib/patterns/background_image.lsp")
(load "lib/css.lsp")

(println "Testing background_image.lsp")

(setf __html "" __css "" @dir "testdir" @imagedir "image") 

(setf $1 nil)
(catch
    (begin
        (make-dir @dir)
        (make-dir (format "%s/%s" @dir @imagedir))))

(P:background-image (image "/home/denis/tmp/heading2.jpg"))
(assert-like __html "<div class='c([0-9]+)'></div>")
(set 'classname (string ".c" $1))
;; important! there is \n in the end of css rule, set it here too!
(set 'css_str (string classname " { background:url('" @imagedir "/heading2.jpg') no-repeat; width:250px; height:76px; }\n"))
(assert-equal __css css_str)
(assert-true (file? (format "%s/%s/%s" @dir @imagedir "heading2.jpg")))

(catch
    (begin
        (delete-file (format "%s/%s/%s" @dir @imagedir "heading2.jpg"))
        (remove-dir (format "%s/%s" @dir @imagedir))
        (remove-dir @dir)))




