(define (horner_eval x cofficient_sequence)
    (accumulate
        (lambda (this_coeff higher_terms)
            (+ this_coeff (* x higher_terms)))
        0
        cofficient_sequence))