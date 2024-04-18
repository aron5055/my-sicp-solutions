(define (smallest_divisor n)
    (define (iter divisor)
        (cond ((> (square divisor) n) n)
              ((= (remainder n divisor) 0) divisor)
              (else (iter (+ 1 divisor)))))
    (iter 2))

(define (prime? num)
    (= (smallest_divisor num) num))

(define (timed_prime_test n)
    (newline)
    (display n)
    (start_prime_test n (runtime)))

(define (start_prime_test n start_time)
    (if (prime? n)
        (report_prime (- (runtime) start_time))))

(define (report_prime elapsed_time)
    (display " *** ")
    (display elapsed_time))

(define (search_for_primes start end)
    (cond ((< start end)
        (timed_prime_test start)
        (search_for_primes (+ 2 start) end))))

(search_for_primes 1001 1019)
(search_for_primes 10001 10037)
(search_for_primes 100001 100043)
(search_for_primes 1000001 1000037)