(define set '())

(define (count-pairs x)
    (cond ((not (pair? x)) 0)
          ((memq x set) 0)
          (else (set! set (cons x set))
                (+ 1 (count-pairs (car x))
                     (count-pairs (cdr x))))))

(define three (list 1 2 3))

(define l '(x))
(define four (list (cons l l)))

(define l2 (cons l l))
(define seven (cons l2 l2))

(define never-return (list 1 2))
(set-cdr! (last-pair never-return) never-return)