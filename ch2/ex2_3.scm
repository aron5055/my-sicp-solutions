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

(define (make_rect_by_point left_lower right_upper)
    (cons left_lower right_upper))


(define (left_lower rect)
    (car left_lower))

(define (right_upper rect)
    (cdr rect))

(define (len rect)
    (let ((lx (x_point (left_lower rect)))
          (rx (x_point (right_upper rect))))
        (abs (- rx lx))))

(define (width rect)
    (let ((ly (y_point (left_lower rect)))
          (ry (y_point (right_upper rect))))
        (abs (- ry ly))))

(define (perimeter rect)
    (* 2 (+ (width rect) (len rect))))

(define (area rect)
    (* (width rect) (len rect)))