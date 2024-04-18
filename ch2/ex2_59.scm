(define (element_of_set? x set)
    (cond ((null? set) #f)
          ((equal? x (car set)) #t)
          (else (element_of_set? x (cdr set)))))

(define (adjoin_set x set)
    (if (element_of_set? x set)
        set
        (cons x set)))

(define (intersection_set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element_of_set? (car set1) set2)
           (cons (car set1)
                  (intersection_set (cdr set1) set2)))
          (else (intersection_set (cdr set1) set2))))


(define (union_set set1 set2)
    (if (null? set1)
        set2
        (cons (car set1) (union_set (cdr set1) set2))))
