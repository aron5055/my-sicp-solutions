(define (reverse lst)
    (define (iter res lst)
        (if (null? lst)
            res
            (iter (cons (car lst) res) (cdr lst))))
    (iter '() lst))


(define (deep_reverse lst)
    (if (not (pair? lst))
        lst
        (reverse (map deep_reverse lst))))