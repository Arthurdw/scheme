(define (atom? x)
    (not (pair? x)))

(define (leaf-count lst)
  (cond ((null? lst) 0)
        ((atom? lst) 1)
        (else (+ (leaf-count (car lst))
                 (leaf-count (cdr lst))))))

(leaf-count '((1 2) ((3 4) 5) (6 7))) ; ; (out) 7
