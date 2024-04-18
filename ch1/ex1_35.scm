(define tolerance 0.00001)

(define (fix_point f first_guess)
    (define (close_enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close_enough? guess next)
                next
                (try next))))
    (try first_guess))

(define golden_ratio
    (fix_point (lambda (x) (+ 1 (/ 1 x))) 1.0))

