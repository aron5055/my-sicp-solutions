(define (square x)
    (* x x))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m)) m))
          (else
           (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fermat_test num)
    (define (try_it a)
        (= (expmod a n n) a))
    (try_it (+ 1 (random (- n 1)))))


(define (fast_prime? n times)
    (cond ((= times 0) #t)
          ((fermat_test n) (fast_prime? n (- times 1)))
          (else #f)))


(define (timed_prime_test n)
    (newline)
    (display n)
    (start_prime_test n (runtime)))

(define (start_prime_test n start_time)
    (if (fast_prime? n 100)
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