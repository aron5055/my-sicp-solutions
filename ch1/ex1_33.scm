(define (filtered_accumulate combiner null_value term a next b predicate)
    (cond ((> a b) null_value)
          ((predicate a) (combiner (term a) (filtered_accumulate combiner null_value term a next b predicate)))
          (else (filtered_accumulate combiner null_value term a next b predicate))))


(define (filtered_accumulate_iter combiner null_value term a next b predicate)
    (define (iter a res)
        (cond ((> a b) res)
              ((predicate a) (iter (next a) (+ (term a) res)))
              (else (iter (next a) res)))))


(define (add x y)
    (+ x y))

(define (inc x)
    (+ x 1))

(define (mul x y)
    (* x y))

(define (sum_square_prime a b)
    (filtered_accumulate add 0 square a inc b prime?))

(define (product_positive n)
    (define (relative_prime? num)
        (= (gcd num n) 1))
    (filtered_accumulate mul 1 id 1 inc n relative_prime?))