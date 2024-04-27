(define (make-monitored fn)
    (define call-count 0)
    (define (mf message)
        (cond ((eq? message 'how-many-calls) call-count)
              ((eq? message 'set-count) (set! call-count 0))
              (else (set! call-count (+ 1 call-count))
                    (fn message))))
    mf)


(define s (make-monitored sqrt))