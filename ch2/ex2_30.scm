(define (square_tree tree)
    (map (lambda (sub_tree)
        (if (not (pair? sub_tree))
            (* sub_tree sub_tree)
            (square_tree sub_tree)))
          tree))

