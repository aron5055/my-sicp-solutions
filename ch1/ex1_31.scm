(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))

(define (product_iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (id x)
    x)

(define (inc x) (+ x 1))

(define (factorial n)
    (product id 1 inc n))

(define (compute_pi2)
    (define (pi_term n)
        (if (even? n)
            (/ (+ n 2) (+ n 1))
            (/ (+ n 1) (+ n 2))))
    (* 4.0 (product pi_term 1 inc 10)))

(define (compute_pi)
    (define (next a)
        (/ (+ 1 (denominator a)) (+ 1 (numerator a))))
    (define (iter n a res)
        (if (= n 0)
            res
            (iter (- n 1) (next a) (* res a))))
    (* 4.0 (iter 100 (/ 2 3) 1)))