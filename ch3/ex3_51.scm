(define (stream-enumerate-interval lo hi)
    (if (> lo hi)
        '()
        (cons-stream lo (stream-enumerate-interval (+ lo 1) hi))))

(define (display-line x)
    (newline)
    (display x))

(define (show x)
    (display-line x)
    x)

(define x (stream-map show (stream-enumerate-interval 0 10)))
