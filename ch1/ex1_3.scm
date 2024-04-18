(define (square x)
    (* x x))

(define (sum_of_squares x y)
    (+ (square x) (square y)))

(define (two_larger_squares x y z)
    (cond ((and (> x y) (> z y)) (sum_of_squares x z))
          ((and (> x z) (> y z)) (sum_of_squares x y))
          (else (sum_of_squares y z))))

(two_larger_squares 1 2 3)
(two_larger_squares 3 2 1)
(two_larger_squares 3 1 2)
(two_larger_squares 2 1 3)
(two_larger_squares 1 1 1)
