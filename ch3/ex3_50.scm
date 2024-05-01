(define (stream-map proc . argstream)
    (if (null? (car argstream))
        '()
        (cons-stream
            (apply proc (map car argstreams))
            (apply stream-map (cons proc (map stream-cdr argstreams))))))