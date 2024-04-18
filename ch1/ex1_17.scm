; for test
; (define (double x)
;     (* 2 x))

; (define (halve x)
;     (/ x 2.0))

(define (my_mul a b)
    (cond ((= b 0) 0)
          ((even? b) (double (my_mul a (halve b))))
          (else (+ a (my_mul a (- b 1))))))