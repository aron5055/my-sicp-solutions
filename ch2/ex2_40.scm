(define (enumerate start end)
    (if (> start end)
        '()
        (cons start (enumerate (+ 1 start) end))))


(define (unique_pairs n)
    (append-map (lambda (i)
                    (map (lambda (j)
                            (list j i))
                         (enumerate 1 (- i 1))))
                (enumerate 1 n)))


(define (prime_sum_pairs n)
    (map make_pair_sum (filter prime_sum? (unique_pairs n))))