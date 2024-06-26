(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
            (if (same_variable? exp var)
                1
                0))
          ((sum? exp)
            (make_sum (deriv (addend exp) var)
                      (deriv (augend exp) var)))
          ((product? exp)
            (make_sum
                (make_product
                    (multiplier exp)
                    (deriv (multiplicand exp) var))
                (make_product
                    (multiplicand exp)
                    (deriv (multiplier exp) var))))
          ((exponentiation? exp)
            (make_product
                (make_product (exponent exp) (make_exponentition (base exp) (- (exponent exp) 1)))
                (deriv (base exp) var)))
          (else (error "Unknown expression type: DERIV" exp))))


(define (variable? x)
    (symbol? x))

(define (same_variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
    (and (number? exp) (= exp num)))

(define (make_sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))

(define (addend s)
    (cadr s))

(define (augend s)
    (fold-left make_sum 0 (cddr sum)))

(define (make_product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))

(define (product? x)
    (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
    (cadr p))

(define (multiplicand p)
    (fold-left make_product 1 (cddr p)))

(define (make_exponentition base exponent)
    (cond ((= exponent 1) base)
          ((or (= exponent 0) (= base 1)) 1)
          ((= base 0) 0)
          ((and (number? base) (number? exponent)) (expt base exponent))
          (else (list '** base exponent))))

(define (exponentiation? exp)
    (and (pair? exp) (eq? (car exp) '**)))

(define (base exp)
    (cadr exp))

(define (exponent exp)
    (caddr exp))

