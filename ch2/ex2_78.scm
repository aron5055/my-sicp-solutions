
(define (attach_tag type_tag contents)
    (cond ((eq? type_tag 'scheme-number) contents)
          ((symbol? type_tag) (cons type_tag contents))
          (else (error ))))

(define (type_tag datum)
    (cond ((number? datum) 'scheme-number)
          ((pair? datum) (car datum))
          (else (error ))))

(define (contents datum)
    (cond ((number? datum) datum)
          ((pair? datum) (cdr datum))
          (else (error ))))