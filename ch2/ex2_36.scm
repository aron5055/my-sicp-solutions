(define (accumulate_n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
              (accumulate_n op init (map cdr seqs)))))