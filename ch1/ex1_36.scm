(define tolerance 0.00001)

(define (fix_point f first_guess)
    (define (close_enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (cond ((close_enough? guess next) next)
                  (else (display next)
                        (newline )
                        (try next)))))
    (try first_guess))


(define (average x y) (/ (+ x y) 2))

(define (answer n)
    (fix_point (lambda (x) (average x (/ (log 1000) (log x)))) n))
