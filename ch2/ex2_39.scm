(define (fold_left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))


(define (fold_right op initial sequence)
    (if (null? sequence)
        '()
        (op (car sequence)
            (fold_right op initial (cdr sequence)))))


(define (reverse sequence)
    (fold_right
        (lambda (x y) (append y (list x))) '() sequence))


(define (reverse2 sequence)
    (fold_left
        (lambda (x y) (cons y x)) '() sequence))