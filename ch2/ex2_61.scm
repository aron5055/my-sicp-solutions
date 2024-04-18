(define (adjoin_set x set)
    (if (< x (car set)
        (cons x set)
        (cons (car set)
            (adjoin_set x (cdr set))))))