(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin_frame frame)
    (car frame))

(define (edge1_frame frame)
    (cadr frame))


(define (edge2_frame frame)
    (caddr frame))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))


(define (origin_frame2 frame)
    (car frame))


(define (edge1_frame2 frame)
    (cadr frame))

(define (edge2_frame2 frame)
    (cddr frame))