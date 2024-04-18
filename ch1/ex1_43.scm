(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated fn n)
    (if (= n 1)
        fn
        (compose fn (repeated fn (- n 1)))))