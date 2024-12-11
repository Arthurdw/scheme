(define (atom? x)
  (not (pair? x)))

(define (depth lst)
  (cond ((null? lst) 0)
        ((atom? lst) 0)
        (else (max (+ (depth (car lst)) 1)
                   (depth (cdr lst))))))

(depth '((1 2) ((3 4) 5) (6 7))) ; ; (out) 3
