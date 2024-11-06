; Given methods:
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (rec-fast-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((= (modulo b 2) 0) (rec-fast-multiply (double a) (halve b)))
        (else (+ a (rec-fast-multiply a (- b 1))))))

(define (iter-fast-multiply a b)
  (define (helper x y odd-add)
    (cond ((= y 0) 0)
          ((= y 1) (+ x odd-add))
          ((= (modulo y 2) 0) (helper (double x) (halve y) odd-add))
          (else (helper x (- y 1) x))))
  (helper a b 0))

(rec-fast-multiply 5 2)
(rec-fast-multiply 10 20)
(rec-fast-multiply 3 3)
(iter-fast-multiply 5 2)
(iter-fast-multiply 3 2)
(iter-fast-multiply 3 3)
