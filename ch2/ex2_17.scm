(define (last_pair lst)
    (cond ((null? lst) '())
          ((null? (cdr lst)) (car lst))
          (else (last_pair (cdr lst)))))