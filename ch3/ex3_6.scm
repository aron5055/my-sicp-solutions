(define (make-rand init)
    (let ((x init))
        (define (dispatch message)
            (cond ((eq? message 'generate) (begin (set! x (rand-update x)) x)))
                  ((eq? message 'reset) (lambda (new-init) (set! x new-init))
                  (else (error "Unknown message")))))
    dispatch)


(define rand (make-rand 42))