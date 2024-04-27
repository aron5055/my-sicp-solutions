(define (random-in-range low high)
    (let ((range (- high low)))
        (+ low (random range))))

(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
        (cond ((= trials-remaining 0) (/ trials-passed trials))
              ((experiment) (iter (- trials-remaining 1) (+ 1 trials-passed)))
              (else (iter (- trials-remaining 1) trials-passed))))
    (iter trials 0))

(define (square x)
    (* x x))

(define (make-in-circle x y r)
    (lambda (px py) (<= (+ (square (- px x)) (square (- py y))) (square r))))

(define in-circle? (make-in-circle 5 7 3))


(define (area x1 x2 y1 y2)
    (* (abs (- x2 x1)) (abs (- y2 y1))))

(define (estimate-integral predicate x1 x2 y1 y2 trials)
    (define (random-point-in-circle? )
        (predicate (random-in-range x1 x2) (random-in-range y1 y2)))
    (* (monte-carlo trials random-point-in-circle?) (area x1 x2 y1 y2)))