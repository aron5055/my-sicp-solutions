(define (sub_interval a b)
    (make_inerval
        (- (lower_bound a) (lower_bound b))
        (- (upper_bound a) (upper_bound b))))