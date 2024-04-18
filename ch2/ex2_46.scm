(define (make_vect x y)
    (cons x y))


(define (xcor_vect vect)
    (car vect))


(define (ycor_vect vect)
    (cdr vect))


(define (add_vect v1 v2)
    (make_vect (+ (xcor_vect v1) (xcor_vect v2))
               (+ (ycor_vect v1) (ycor_vect v2))))


;;; very easy