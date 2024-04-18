(define (first_denomination lst)
    (car lst))


(define (except_first_denomination lst)
    (cdr lst))

(define (no_more? lst)
    (null? lst))