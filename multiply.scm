; TODO: figure this out
(define (rec-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) (+ (rec-multiply a 0) a))
        ((= b 2) (+ (rec-multiply a 1) a))))

(rec-multiply 5 2)

(define (iter-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) (+ (rec-multiply a 0) a))
        ((= b 2) (+ (rec-multiply a 1) a))))


