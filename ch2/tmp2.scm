(define (entry tree)
    (car tree))


(define (left_branch tree)
    (cadr tree))

(define (right_branch tree)
    (caddr tree))


(define (make_tree entry left right)
    (list entry left right))

(define (element_of_set? x set)
    (cond ((null? set) #f)
          ((= x (entry set)) #t)
          ((< x (entry set)) (element_of_set? x (left_branch set)))
          ((> x (entry set)) (element_of_set? x (right_branch set)))))


(define (adjoin_set x set)
    (cond ((null? set) (make_tree x '() '()))
          ((= x (entry set)) set)
          ((< x (entry set))
            (make_tree
                (entry set)
                (adjoin_set x (left_branch set))
                (right_branch set)))
          ((> x (entry set))
            (make_tree
                (entry set)
                (left_branch set)
                (adjoin_set x (right_branch set))))))