(define (iter-product factor a next b)
  (define (iter acc factor a next b)
    (if (> a b)
      acc
      (iter (* acc (factor a)) factor (next a) next b)))
  (iter 1 factor a next b))

(iter-product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 120
