(context 'Img)

(define (get-size path)
    (set 'size_part ((parse ((exec (string "identify " path)) 0) " ") 2))
    (set 'width ((parse size_part "x") 0))
    (set 'height ((parse size_part "x") 1))
    (list width height))

(context MAIN)

