(define (double fun)
    (lambda (x) (fun (fun x))))

(define (inc x) (+ x 1))