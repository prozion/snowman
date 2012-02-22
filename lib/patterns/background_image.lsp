;; 'Background image' pattern (p.36)

(context 'Pattern)

;; args: '((title "Background Image") (image "heading2.jpg") (width "250px") (height "76px"))
(define (background-image)
    (set 'title (eval (lookup 'title (args 0))))

    (set 'image (eval (lookup 'image (args 0)))) ;; TODO: take image at the pointed random location and move it to some images folder of generated template. Stylesheet will have the new (now relative) location in its url(...)
    (set 'imagename (filename image))

    (set 'width (eval (lookup 'width (args 0))))
    (set 'height (eval (lookup 'height (args 0))))

    (set 'html (string "<h1>" title "</h1><div></div>")
    (set 'css (string "div { background:url('" image "') no-repeat; width:" width "; height:" height "; }")
    (set 'img_assoc_list '((image imagename)))
    (set 'retval (list html css nil img_assoc_list)) ;; '(html_string css_string js_string '((image1_initial_location image1_new_locatioin) (image2_initial image2_new) ...))) ? 
    ;; I think <html>, <css> and <js> will be glued into the correspondent big strings one per each stream  and then this strings will be written into files, in some 'constructor' function (name of the file this function will be reside in?). Regarding images 'stream' in the same general (constructing) file images stream will be glued into one big assoc-list. Then the file will be taken from the 'keys' in assoc-list and copied to the images/ folder of template under the name of correspondent 'values'.
retval)

(context MAIN)


