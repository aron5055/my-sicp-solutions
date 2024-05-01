(define (cycle? x)
    (define (helper x set)
        (cond ((null? x) #f)
              ((not (pair? x)) #f)
              ((memq x set) #t)
              (else (or (helper (car x) (cons x set))
                        (helper (cdr x) (cons x set))))))
    (helper x '()))


(define no-cycle (list 1 2 3))

(define cycle (list 1 2 3))
(set-cdr! (last-pair cycle) cycle)