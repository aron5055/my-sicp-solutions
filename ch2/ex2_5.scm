(define (mycons a b)
    (* (expt 2 a) (expt 3 b)))

; from http://community.schemewiki.org/?sicp-ex-2.5
(define (count_zero_remainder n p d)
    (if (= (remainder p d) 0)
        (count_zero_remainder (+ n 1) (/ p d) d)
        n))


(define (mycar pair)
    (count_zero_remainder 0 pair 2))

(define (mycdr pair)
    (count_zero_remainder 0 pair 3))