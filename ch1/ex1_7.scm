(define (sqrt x)
    (sqrt_iter 1.0 x))

(define (sqrt_iter guess x)
    (if (good_enough? guess x)
        guess
        (sqrt_iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good_enough? guess x)
    (< (abs (- guess (improve guess x))) (* guess 0.001)))

