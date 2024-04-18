(define (accumulate_n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
              (accumulate_n op init (map cdr seqs)))))

(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq)
            (accumulate op init (cdr seq)))))

(define (dot_product v w)
    (accumulate + 0 (map * v w)))

(define (matrix_*_vector m v)
    (map (lambda (row) (dot_product row v)) m))

(define (transpose mat)
    (accumulate_n cons '() mat))

(define (matrix_*_matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (row) (matrix_*_vector cols row)) m)))