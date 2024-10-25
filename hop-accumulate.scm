(define (accumulate combiner null-value term a next b)
  (define (iter acc current)
    (if (> current b)
      acc
      (iter (combiner acc (term current)) (next current))))
  (iter null-value a))

(accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
