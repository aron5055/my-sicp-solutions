(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated fn n)
    (if (= n 1)
        fn
        (compose fn (repeated fn (- n 1)))))

(define (smooth fn)
    (let ((dx 0.00001))
        (lambda (x) (/ 3 (+ (fn (- x dx)) (fn x) (fn (+ x dx)))))))


(define (nth_smooth nth)
    (repeat smooth nth))