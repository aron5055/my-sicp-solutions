(define (square x)
    (* x x))

(define (square_list lst)
    (map square lst))


(define (square_list_iter items)
    (if (null? items)
        nil
        (cons (square (car items)) (cdr items))))