(define (iterative_improve good_enough? improve)
    (define (try guess)
        (let ((next (improve guess)))
            (if (good_enough? guess next)
                next
                (try next))))
    try)


(define (sqrt x)
    ((iterative_improve
        (lambda (y) (< (abs (- square y) x) 0.0001))
        (lambda (y) (average y (/ x y))))
     1.0))