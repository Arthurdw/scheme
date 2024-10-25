(define (product factor a next b)
  (if (> a b)
    1
    (* (factor a) (product factor (next a) next b))))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(factorial 5)
