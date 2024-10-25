(define (accumulate combiner null-value term a next b)
  (define (iter acc current)
    (if (> current b)
      acc
      (iter (combiner acc (term current)) (next current))))
  (iter null-value a))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product factor a next b)
  (accumulate * 1 factor a next b))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 15
(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 120
