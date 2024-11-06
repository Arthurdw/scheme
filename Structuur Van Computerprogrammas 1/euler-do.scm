(define (calc-e n)
  (do ((i 1 (+ i 1))
        (prev-fac 1 (* i prev-fac))
        (prev-e 1 (+ prev-e (/ 1 (* i prev-fac)))))
      ((> i n) prev-e)))

(exact->inexact (calc-e 10))
