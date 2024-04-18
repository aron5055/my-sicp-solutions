(define (make_center_percent center percentage)
    (make_center_width center (* center percentage)))


(define (width interval)
    (/ (- (upper_bound interval) (lower_bound interval)) 2))


(define (center interval)
    (/ (+ (lower_bound interval) (upper_bound interval)) 2))


(define (percent interval)
    (/ (width interval) (center interval)))