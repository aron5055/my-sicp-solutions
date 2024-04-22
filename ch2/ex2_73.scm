(define (install_sum_package)
    (define (addend s)
        (cadr s))
    (define (augend s)
        (caddr s))
    (define (deriv_sum s var)
        (make_sum (deriv (addend s) var)
                  (deriv (augend s) var)))
    (define (make_sum a1 a2)
        (cond ((=number? a1 0) a2)
              ((=number? a2 0) a1)
              ((and (number? a1) (number? a2)) (+ a1 a2))
              (else (list '+ a1 a2))))
    (put 'deriv '(+) deriv_sum)
    (put 'make_sum '+ make_sum)
    'done)


(define (install_product_package)
    (define (multiplier p)
        (cadr p))
    (define (multiplicand p)
        (caddr p))
    (define (deriv_product p var)
        (make_sum (make_product (multiplier p) (deriv (multiplicand p) var))
                  (make_product (multiplicand p) (deriv (multiplier p) var))))
    (define (make_product m1 m2)
        (cond ((or (=number? m1 0) (=number? m2 0)) 0)
              ((=number? m1 1) m2)
              ((=number? m2 1) m1)
              ((and (number? m1) (number? m2)) (* m1 m2))
              (else (list '* m1 m2))))
    (put 'deriv '(*) deriv_product)
    (put 'make_product '* make_product)
    'done)