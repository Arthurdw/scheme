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

(define (product-gcd n)
  (filtered-accumulate * (lambda (x) (= (gcd x n) 1)) 1 (lambda (a) a) 1 (lambda (a) (+ a 1)) n))

(product-gcd 6) ; ; (out) 5
(product-gcd 7) ; ; (out) 720
