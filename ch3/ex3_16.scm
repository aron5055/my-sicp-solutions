(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))


(define three (list 1 2 3))

(define l '(x))
(define four (list (cons l l)))

(define l2 (cons l l))
(define seven (cons l2 l2))

(define never-return (list 1 2))
(set-cdr! (last-pair never-return) (last-pair never-return))