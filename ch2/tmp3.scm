(define (square x)
    (* x x))

(define (attach_tag type_tag contents)
    (cons type_tag contents))

(define (type_tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum: TYPE_TAG" datum)))


(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum: CONTENTS" datum)))


(define (rectangular? z)
    (eq? (type_tag z) 'rectangular))


(define (polar? z)
    (eq? (type_tag z) 'polar))


(define (real_part_rectangular z)
    (car z))

(define (imag_part_rectangular z)
    (cdr z))


(define (magnitude_rectangular z)
    (sqrt (+ (square (real_part_rectangular z)
             (square (imag_part_rectangular z))))))


(define (angle_rectangular z)
    (atan (imag_part_rectangular z)
          (real_part_rectangular z)))


(define (make_from_read_imag_rectangular x y)
    (attach_tag 'rectangular (cons x y)))


(define (make_from_mag_ang_rectangular r a)
    (attach_tag 'rectangular (cons (* r (cos a)) (* r (sin a)))))

(define (real_part_polar z)
    (* (magnitude_polar z)
       (cos (angle_polar z))))


(define (imag_part_polar z)
    (* (magnitude_polar z)
       (sin (angle_polar z))))

(define (magnitude_polar z)
    (car z))

(define (angle_polar z)
    (cdr z))

(define (make_from_real_imag_polar x y)
    (attach_tag 'polar (cons (sqrt (+ (square x) (square y))) (atan y x))))


(define (make_from_mag_ang_polar r a)
    (attach_tag 'polar (cons r a)))


(define (real_part z)
    (cond ((rectangular? z) (real_part_rectangular (contents z)))
          ((polar? z) (real_part_polar (contents z)))
          (else (error "Unknown type: REAL_PART" z))))

(define (imag_part z)
    (cond ((rectangular? z) (imag_part_rectangular (contents z)))
          ((polar? z) (imag_part_polar (contents z)))
          (else (error "Unknown type: IMAG_PART" z))))


(define (magnitude z)
    (cond ((rectangular? z) (magnitude_rectangular (contents z)))
          ((polar? z) (magnitude_polar (contents z)))
          (else (error "Unknown type: MAGNITUDE" z))))


(define (angle z)
    (cond ((rectangular? z) (angle_rectangular (contents z)))
          ((polar? z) (angle_polar (contents z)))
          (else (error "Unknown type: ANGLE" z))))

(define (make_from_real_imag x y)
    (make_from_read_imag_rectangular x y))

(define (make_from_mag_ang r a)
    (make_from_mag_ang_polar r a))