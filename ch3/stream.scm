(define (integers-starting-from n)
    (cons-stream n (integers-starting-from (+ n 1))))

(define (divisible? a b)
    (= (remainder a b) 0))

(define (sieve stream)
    (cons-stream (stream-car stream)
                 (sieve (stream-filter
                            (lambda (x) (not (divisible? x (stream-car stream))))
                            (stream-cdr stream)))))

(define primes (sieve (integers-starting-from 2)))