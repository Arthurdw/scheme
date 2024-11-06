(define (product factor a next b)
  (if (> a b)
    1
    (* (factor a) (product factor (next a) next b))))

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 120
