(define (reverse lst)
    (define (iter lst res)
        (if (null? lst)
            res
            (iter (cdr lst) (cons (car lst) res))))
    (iter lst '()))
