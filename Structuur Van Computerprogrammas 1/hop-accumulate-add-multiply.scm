(define (accumulate combiner null-value term a next b)
  (define (iter acc current)
    (if (> current b)
      acc
      (iter (combiner acc (term current)) (next current))))
  (iter null-value a))

(define (add x y)
  (accumulate + x (lambda (_) 1) 1 (lambda (n) (+ n 1)) y))


(define (multiply x y)
  (accumulate + 0 (lambda (_) x) 1 (lambda (n) (+ n 1)) y))


(add 4 5) ; ; (out) 9
(multiply 5 2) ; ; (out) 10
