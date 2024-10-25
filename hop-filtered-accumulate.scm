(define (filtered-accumulate combiner filter? null-value term a next b)
  (define (iter acc current)
    (if (> current b)
      acc
      (iter
        (if (filter? current)
          (combiner acc (term current))
          acc)
        (next current))))
  (iter null-value a))

(filtered-accumulate * (lambda (x) (= x 2)) 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 2
(filtered-accumulate + even? 0 (lambda (a) a) 1 (lambda (a) (+ a 1)) 9) ; ; (out) 20
(filtered-accumulate + odd? 0 (lambda (a) a) 1 (lambda (a) (+ a 1)) 9) ; ; (out) 25
