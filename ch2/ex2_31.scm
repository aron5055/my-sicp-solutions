(define (tree_map fun tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (fun tree))
          (else (cons (tree_map fun (car tree))
                      (tree_map fun (cdr tree))))))


(define (square_tree tree)
    (tree_map (lambda (x) (* x x)) tree))