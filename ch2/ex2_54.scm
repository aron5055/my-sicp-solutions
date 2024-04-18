(define (myequal? l1 l2)
    (cond ((and (not (pair? l1)) (not (pair? l2))) (eq? l1 l2))
          ((and (pair? l1) (pair? l2)) (and (myequal? (car l1) (car l2)) (myequal? (cdr l1 l2))))
          (else #f)))