(define (front-ptr queue)
    (car queue))

(define (rear-ptr queue)
    (cdr queue))

(define (set-front-ptr! queue item)
    (set-car! queue item))

(define (set-rear-ptr! queue item)
    (set-cdr! queue item))

(define (empty-queue? queue)
    (null? (front-ptr queue)))

(define (make-queue )
    (cons '() '()))


(define (front-queue queue)
    (if (empty-queue? queue)
        (error "FRONT called with an empty queue" queue)
        (car (front-ptr queue))))


(define (insert-queue! queue item)
    (let ((new-pair (cons item '())))
        (cond ((empty-queue? queue)
               (set-front-ptr! queue new-pair)
               (set-rear-ptr! queue new-pair)
               queue)
              (else (set-cdr! (rear-ptr queue) new-pair)
                    (set-rear-ptr! queue new-pair)
                    queue))))

(define (delete-queue! queue)
    (cond ((empty-queue? queue) (error "DELETE called with an empty queue" queue))
          (else (set-front-ptr! queue (cdr (front-ptr queue)))
                queue)))

(define (print-queue queue)
    (define (iter ptr)
        (cond ((null? ptr) (display ">") '())
              (else (display (car ptr))
                    (display " ")
                    (iter (cdr ptr)))))
    (display "< ")
    (iter (front-ptr queue)))


(define (make-deque )
    (cons (make-queue) (make-queue)))

(define (front-deque-ptr deque)
    (car deque))

(define (rear-deque-ptr deque)
    (cdr deque))

(define (empty-deque? deque)
    (and (empty-queue? (front-deque-ptr deque))
         (empty-queue? (rear-deque-ptr deque))))

(define (front-deque deque)
    (front-queue (front-deque-ptr deque)))

(define (rear-deque deque)
    (front-queue (rear-deque-ptr deque)))


(define (front-insert-deque! deque item)
    (insert-queue! (front-deque-ptr deque) item))

(define (rear-insert-deque! deque item)
    (insert-queue! (rear-deque-ptr deque) item))

(define (front-delete-deque! deque)
    (delete-queue! (front-deque-ptr deque)))

(define (rear-delete-deque! deque)
    (delete-queue! (rear-deque-ptr deque)))


(define (print-deque deque)
    (print-queue (front-deque-ptr deque))
    (display " + ")
    (print-queue (rear-deque-ptr deque)))

(define d (make-deque))

