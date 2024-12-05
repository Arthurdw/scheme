(define (atom? x)
  (not (pair? x)))

(define (fringe lst)
  (cond ((null? lst) '())
        ((atom? lst) (list lst))
        (else (append (fringe (car lst)) (fringe (cdr lst))))))

(fringe '((1) ((((2)))) (3 (4 5) 6) ((7) 8 9))) ; ; (out) (1 2 3 4 5 6 7 8 9)
