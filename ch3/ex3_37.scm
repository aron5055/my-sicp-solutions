(define (c- x y)
    (let ((z (make-connector)))
        (adder z y x)
        z))

(define (c* x y)
    (let ((z (make-connector)))
        (multiplier x y z)
        z))

(define (c/ x y)
    (let ((z (make-connector)))
        (multiplier z y x)
        z))

(define (cv value)
    (let ((z (make-connector)))
        (constant value z)
        z))

(define F (make-connector))

(define (fahrenheit-celsius-converter f)
    (c/ (c* (cv 5) (c- f (cv 32))) (cv 9)))