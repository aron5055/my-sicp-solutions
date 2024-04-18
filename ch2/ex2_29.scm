(define (make_mobile left right)
    (list left right))

(define (make_branch length structure)
    (list length structure))

(define (left_branch mobile)
    (car mobile))

(define (right_branch mobile)
    (cadr mobile))

(define (branch_length branch)
    (car branch))

(define (branch_structure branch)
    (cadr branch))

(define (sum lst)
    (reduce + 0 lst))

(define (fringe tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))
          (else (append (fringe (car tree)) (fringe (cdr tree))))))

(define (total_weight mobile)
    (sum (fringe mobile)))

(define m1 (make_mobile
             (make_branch 4 6)
             (make_branch 5
                          (make_mobile
                           (make_branch 3 7)
                           (make_branch 9 8)))))

(define (balanced? mobile)
    (let ((left (left_branch mobile))
          (right (right_branch mobile)))
        (= (* (branch_length left) (total_weight left)) (* (branch_length right) (total_weight right)))))