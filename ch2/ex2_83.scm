(put 'raise '(scheme-number) (lambda (x) (make_rational x 1)))
(put 'raise '(rational) (lambda (x) (make_real (* 1.0 (/ (numer x) (denom x))))))
(put 'raise '(real) (lambda (x) (make_complex_from_real_imag x 0)))