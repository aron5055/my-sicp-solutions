(define (make_segment start end)
    (cons start end))

(define (start_segment segment)
    (car segment))

(define (end_segment segment)
    (cdr segment))

(define (make_point x y)
    (cons x y))

(define (x_point point)
    (car point))

(define (y_point point)
    (cdr point))

(define (average x y)
    (/ (+ x y) 2))

(define (midpoint_segment segment)
    (let ((start (start_segment segment))
          (end   (end_segment segment)))
        (make_point
            (average (x_point start) (x_point end))
            (average (y_point start) (y_point end)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))