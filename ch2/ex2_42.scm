(define (enumerate_interval start end)
    (if (> start end)
        '()
        (cons start
              (enumerate_interval (+ 1 start) end))))


(define empty_board '())


(define (all lst)
    (reduce (lambda (x y) (and x y)) #t lst))

(define (check a b)
    (let ((ax (car a))
          (ay (cadr a))
          (bx (car b))
          (by (cadr b)))
         (and (not (= ax bx)) (not (= ay by))
              (not (= (abs (- ax bx)) (abs (- ay by)))))))

(define (safe? positions)
    (all (map
            (lambda (x)
                (if (check (car positions) x)
                    #t
                    #f))
            (cdr positions))))


(define (adjoin_position new_row k rest_of_queens)
    (cons (list new_row k) rest_of_queens))


(define (queens board_size)
    (define (queen_cols k)
        (if (= k 0)
            (list empty_board)
            (filter
                (lambda (positions)
                    (safe? positions))
                (append-map
                    (lambda (rest_of_queens)
                        (map (lambda (new_row)
                                (adjoin_position
                                    new_row
                                    k
                                    rest_of_queens))
                             (enumerate_interval 1 board_size)))
                    (queen_cols (- k 1))))))
    (queen_cols board_size))
