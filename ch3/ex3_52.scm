(define (display-line x)
    (newline)
    (display x))

(define (display-stream s)
    (stream-for-each display-line s))

(define (stream-enumerate-interval lo hi)
    (if (> lo hi)
        '()
        (cons-stream lo (stream-enumerate-interval (+ lo 1) hi))))

(define sum 0)

(define (accum x)
    (set! sum (+ x sum))
    sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))


(define y (stream-filter even? seq))


(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))

