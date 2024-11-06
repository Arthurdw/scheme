(define (rec-multiply a b)
  (if (= b 0)
    0
    (+ (rec-multiply a (- b 1)) a)))

(define (iter-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        (else (iter-multiply (+ a a) (- b 1)))))


(rec-multiply 5 2)
(iter-multiply 5 2)
(iter-multiply 3 2)
