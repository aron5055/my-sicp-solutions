(define (square x) (* x x))

(define (exp_mod base n m)
    (cond ((= n 0) 1)
          ((even? n) (remainder (square (exp_mod base (/ n 2) m)) m))
          (else (remainder (* base (exp_mod base (- n 1) m)) m))))

(define (congruent a n)
    (= (exp_mod a n n) a))

(define (test num)
    (define (iter t)
        (cond ((< t num) (and (congruent t num) (iter (+ t 1))))
              (else #t)))
    (iter 2))

(test 561)
(test 1105)
(test 1729)
; 2465, 2821, 6601