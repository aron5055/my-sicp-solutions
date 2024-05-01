(define (append! x y)
    (set-cdr! (last-pair x) y)
    x)


(define x (list 'a 'b))

(define y (list 'c 'd))

(define z (append x y))

(define w (append! x y))