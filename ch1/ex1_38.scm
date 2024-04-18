(define (cond_frac n d k)
    (define (iter k res)
        (if (= k 0)
            res
            (iter (- k 1) (/ (n k) (+ (d k) res)))))
    (iter (- k 1) (/ (n k) (d k))))


(define (d i)
    (if (= (remainder i 3) 2)
        (/ (+ i 1) 1.5)
        1))

(define e (+ 2 (cond_frac (lambda (i) 1.0) d 50)))