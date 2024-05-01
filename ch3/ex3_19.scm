(define (cycle? x)
    (define (helper fast slow)
        (cond ((null? fast) #f)
              ((null? (cdr fast)) #f)
              ((eq? fast slow) #t)
              (else (helper (cddr fast) (cdr slow)))))
    (and (pair? x) (helper (cdr x) x)))

(define no-cycle (list 1 2 3))

(define cycle (list 1 2 3))
(set-cdr! (last-pair cycle) cycle)