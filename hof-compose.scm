(define (compose f g)
  (lambda (arg) (f (g arg))))

(define (f x) (* x x))
(define (g x) (+ x 2))

(f (g 3)) ; ; (out) 25
(compose f g) ; ; (out) #<procedure (? arg)>
((compose f g) 3) ; ; (out) 25
