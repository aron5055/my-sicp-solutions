(define (element_of_set? x set)
    (if (memq? x set)
        #t
        #f))

(define (adjoin_set x set)
    (cons x set))

(define (union_set set1 set2)
    (append set1 set2))

(define (intersection_set set1 set2)
    (cond ((null? set1) '())
          ((element_of_set? (car set1) set2) (cons (car set1) (intersection_set (cdr set1) set2)))
          (else (intersection_set (cdr set1 set2)))))