(define (atom? x)
  (not (pair? x)))

(define (deep-map op lst)
  (cond ((null? lst) '())
        ((atom? lst) (op lst))
        (else (cons (deep-map op (car lst))
                    (deep-map op (cdr lst))))))


(deep-map (lambda (x) (* x x))
          '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9)) ; ; (out) ((((1 . 4) (9 16)) ((25 36) (49 64))) . 81)
