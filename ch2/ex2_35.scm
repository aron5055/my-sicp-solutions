(define (count_leaves tree)
    (accumulate
        +
        0
        (map (lambda (sub)
                (cond ((null? sub) 0)
                      ((pair? sub) (count_leaves sub))
                      (else 1))))))