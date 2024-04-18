(define (square x) (* x x))

(define (nontrivial_exist? n m)
    (cond ((= n 1) #f)
          ((= n (- m 1)) #f)
          (else (= (remainder (square n) m) 1))))

; from http://community.schemewiki.org/?sicp-ex-1.28
(define (exp_mod base n m)
    (cond ((= n 0) 1)
          ((even? n)
            (let ((x (exp_mod base (/ n 2) m)))
                (if (nontrivial_exist? x m)
                    0
                    (remainder (square x) m))))
          (else (remainder (* base (exp_mod base (- n 1) m)) m))))


(define (miller_rabin n)
    (define (iter a)
        (cond ((= a 0) #t)
              ((= (exp_mod a (- n 1) n) 1) (iter (- a 1)))
              (else #f)))
    (iter (- n 1)))