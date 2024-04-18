(define (cond_frac n d k)
    (define (rec i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (rec (+ i 1))))))
    (rec 1))

(define (cond_frac_iter n d k)
    (define (iter k res)
        (if (= k 0)
            res
            (iter (- k 1) (/ (n k) (+ (d k) res)))))
    (iter (- k 1) (/ (n k) (d k))))

(define golden_ratio (/ 1 (cond_frac (lambda (i) 1.0) (lambda (i) 1.0) 50)))
(define golden_ratio2 (/ 1 (cond_frac_iter (lambda (i) 1.0) (lambda (i) 1.0) 50)))