(define (make-semaphore n)
    (let ((lock (make-mutex))
          (taken 0))
        (define (semaphore m)
            (cond ((eq? 'acquire)
                   (lock 'acquire)
                   (if (< taken n)
                       (begin (set! taken (+ 1 taken)) (lock 'release))))
                  ((eq? 'release)
                   (lock 'acquire)
                   (if (> taken 0)
                       (begin (set! taken (- taken 1)) (lock 'release))))))
        semaphore))