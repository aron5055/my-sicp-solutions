(define (make_record key val)
    (cons key val))

(define (key record)
    (car record))

(define (value record)
    (cdr record))

(define (lookup given_key tree_sets)
    (if (null? tree_sets)
        '()
        (let ((record (entry tree_sets)))
            (cond ((equal? (key record) given_key) (value record))
                  ((> (key record) given_key) (lookup given_key (left_branch tree_sets)))
                  (else (lookup given_key (right_branch tree_sets)))))))