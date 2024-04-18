(define (div_interval x y)
    (if (<= 0 (* (lower_bound y) (upper_bound y)))
        (error "y can't span zero.")
        (mul_interval x
            (make_interval (/ 1 (lower_bound y)) (/ 1 (upper_bound y))))))