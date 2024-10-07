(define (calc-e n)
  ; Calculate e by going form the smalled to the largest number
  (define (calc-e-stl x prev-fac prev-e)
    (define fac (* x prev-fac))
    (if (= n x)
      (+ prev-e (/ 1 fac))
      (calc-e-stl (+ x 1) fac (+ prev-e (/ 1 fac)))))
  (calc-e-stl 1 1 1))

(exact->inexact (calc-e 10))
