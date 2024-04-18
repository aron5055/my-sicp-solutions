(define (cond_frac n d k)
    (define (iter k res)
        (if (= k 0)
            res
            (iter (- k 1) (/ (n k) (+ (d k) res)))))
    (iter (- k 1) (/ (n k) (d k))))


(define (tan_cf x k)
    (define (n i)
        (if (= i 1)
            x
            (* x x)))
    (define (d i)
        (- (* 2 i) 1))
    (cond_frac n d k))

