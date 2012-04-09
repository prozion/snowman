
;; 'Left marginal' pattern (p.39)
;
;<div id='s[0-9]+'><div id='s[0-9]'>Heading</div>text</div>
;
;   #s[0-9]+ { position:relative; margin-left: 200px; } 
;   #s[0-9]+ { position:absolute; left:-200px; top:0; margin:0; }

(context 'P)

; (P:left-marginal (margin-left "200px") (t-left "Heading") (t-right "text"))
(define-macro (left-marginal)
    (let (lm_margin_left "0" t_left "" t_right "")
        (map set '(lm_margin_left) (bindl '("margin-left") (args)))
        (let (__html "")
            (map set '(t_left) (bindl '("t-left") (args)))
            (set 't_left__html (if-not (null? __html) __html t_left)))
        (let (__html "")
            (map set '(t_right) (bindl '("t-right") (args)))
            (set 't_right__html (if-not (null? __html) __html t_right)))
        (set 'neg_lm_margin_left (neg lm_margin_left))
        (set 'css_list (css-list (args)))

        ; html:
        (P:block 
            (css.position "relative") (css.margin-left lm_margin_left)
            (P:block 
                (css.position "absolute") (css.left neg_lm_margin_left) (css.top "0") (css.margin "0") 
                (t t_left__html)) 
            (t t_right__html))))

(context MAIN)
