(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) ; ; (out) 15
