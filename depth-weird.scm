(define (depth-weird x)
  (define (weird x ctr)
    (cond ((= x 1) ctr)
          ((even? x) (weird (/ x 2) (+ ctr 1)))
          (else (weird (+ (* 3 x) 1) (+ ctr 1)))))
  (weird x 0))

(depth-weird 15)

