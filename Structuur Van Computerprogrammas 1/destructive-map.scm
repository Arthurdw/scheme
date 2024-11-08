(define (map! f lst)
  (if (not (null? lst))
    (begin
      (set-car! lst (f (car lst)))
      (map! f (cdr lst)))))

(define l '(1 2 3 4))
(map! (lambda (x) (* x x)) l)
l ; ; (out) (1 4 9 16)
