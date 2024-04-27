(define (make_rat n d)
    (let ((g (gcd n d))
          (sign (* n d)))
        (if (< sign 0)
            (cons (- (/ (abs n) g)) (/ (abs d) g))
            (cons (/ (abs n) g) (/ (abs d) g)))))
