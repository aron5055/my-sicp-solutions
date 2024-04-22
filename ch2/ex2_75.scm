(define (make_from_mag_ang r a)
    (define (dispatch op)
        (cond ((eq? op 'magnitude) r)
              ((eq? op 'angle) a)
              ((eq? op 'real_part) (* r (cos a)))
              ((eq? op 'imag_part) (* r (sin a)))
              (else (error "Unknown op: MAKE_FROM_MAG_ANG" op)))))