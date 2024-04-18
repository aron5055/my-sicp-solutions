(define (smallest_divisor n)
    (define (iter divisor)
        (cond ((> (square divisor) n) n)
              ((= (remainder n divisor) 0) divisor)
              (else (iter (+ 1 divisor)))))
    (iter 2))

(smallest_divisor 199)
(smallest_divisor 1999)
(smallest_divisor 19999) ;7