(define (integers-starting-from n)
    (cons-stream n (integers-starting-from (+ n 1))))

(define (mul-stream s1 s2)
    (stream-map * s1 s2))

(define integers (integers-starting-from 1))

(define factorials (cons-stream 1 (mul-stream integers factorials)))