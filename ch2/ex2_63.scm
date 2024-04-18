(define (tree->list1 tree)
    (if (null? tree)
        '()
        (append
            (tree->list1 (left_branch tree))
            (cons (entry tree)
                  (tree->list1 (right_branch treel))))))


(define (tree->list2 tree)
    (define (copy_to_list tree result_list)
        (if (null? tree)
            result_list
            (copy_to_list
                (left_branch tree)
                (cons (entry tree) (copy_to_list (right_branch tree) result_list)))))
    (copy_to_list tree '()))