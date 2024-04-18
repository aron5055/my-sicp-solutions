(define (make_inerval a b)
    (cons a b))


(define (upper_bound interval)
    (car interval))

(define (lower_bound interval)
    (cdr interval))