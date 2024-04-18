 (define (make-sum a1 a2)
   (cond ((=number? a1 0) a2)
         ((=number? a2 0) a1)
         (else (list a1 '+ a2))))

 (define (sum? x) (and (pair? x) (eq? (cadr x) '+)))
 (define (addend s) (car s))
 (define (augend s) (caddr s))
