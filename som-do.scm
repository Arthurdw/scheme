(define (do-add x y)
  (do ((i y (- i 1))
      (res x (+ res 1)))
    ((= i 0) res)))

(do-add 4 5)
