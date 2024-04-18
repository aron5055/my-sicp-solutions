(define (make_leaf symbol weight)
    (list 'leaf symbol weight))


(define (leaf? object)
    (eq? (car object) 'leaf))

(define (symbol_leaf x)
    (cadr x))

(define (weight_leaf object)
    (caddr object))

(define (make_code_tree left right)
    (list left
          right
          (append (symbols left) (symbols right))
          (+ (weight left) (weight right))))

(define (left_branch tree)
    (car tree))

(define (right_branch tree)
    (cadr tree))


(define (symbols tree)
    (if (leaf? tree)
        (list (symbol_leaf tree))
        (caddr tree)))

(define (weight tree)
    (if (leaf? tree)
        (weight_leaf tree)
        (cadddr tree)))

(define (decode bits tree)
    (define (decode1 bits current_branch)
        (if (null? bits)
            '()
            (let ((next_branch (choose_branch (car bits) current_branch)))
                (if (leaf? next_branch)
                    (cons (symbol_leaf next_branch)
                          (decode1 (cdr bits) tree))
                    (decode1 (cdr bits) next_branch)))))
    (decode1 bits tree))

(define (choose_branch bit branch)
    (cond ((= bit 0) (left_branch branch))
          ((= bit 1) (right_branch branch))
          (else (error "bad bit: CHOOSE_BRANCH" bit))))


(define (adjoin_set x set)
    (cond ((null? set) (list x))
          ((< (weight x) (weight (car set))) (cons x set))
          (else (cons (car set) (adjoin_set x (cdr set))))))


(define (make_leaf_set pairs)
    (if (null? pairs)
        '()
        (let ((pair (car pairs)))
            (adjoin_set (make_leaf (car pair) (cadr pair))
                        (make_leaf_set (cdr pairs))))))

(define sample_tree
    (make_code_tree
        (make_leaf 'A 4)
        (make_code_tree
            (make_leaf 'B 2)
            (make_code_tree
                (make_leaf 'D 1)
                (make_leaf 'C 1)))))


(define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode_symbol (car message) tree)
                (encode (cdr message) tree))))

(define (in_symbols? symbol sets)
    (if (memq symbol sets)
        #t
        #f))

(define (encode_symbol symbol tree)
    (cond ((not (in_symbols? symbol (symbols tree))) (error "Symbol not in code tree" symbol))
          ((leaf? tree) '())
          (else (let ((left (left_branch tree))
                      (right (right_branch tree)))
                    (cond ((in_symbols? symbol (symbols left)) (cons 0 (encode_symbol symbol left)))
                          ((in_symbols? symbol (symbols right)) (cons 1 (encode_symbol symbol right))))))))


(define (generate_huffman_tree pairs)
    (successive_merge (make_leaf_set pairs)))


(define (successive_merge pairs)
    (if (= (length pairs) 1)
        (car pairs)
        (let ((first (car pairs))
              (second (cadr pairs)))
            (successive_merge (adjoin_set (make_code_tree first second) (cddr pairs))))))
