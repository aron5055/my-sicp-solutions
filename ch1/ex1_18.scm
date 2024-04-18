; for test
; (define (double x)
;     (* 2 x))

; (define (halve x)
;     (/ x 2.0))


(define (my_mul a b)
    (define (iter product counter multiplier)
        (cond ((= counter 0) product)
              ((even? counter) (iter product (halve counter) (double multiplier)))
              (else (iter (+ product multiplier) (- counter 1) multiplier))))
    (if (> a b)
        (iter 0 a b)
        (iter 0 b a)))