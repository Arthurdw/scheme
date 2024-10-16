(define (rec-reverse collection)
  (if (null? collection)
    collection
    (append (rec-reverse (cdr collection)) (list (car collection)))))

(define (iter-reverse collection)
  (define (iter reversed leftover)
    (if (null? leftover)
      reversed
      (iter (cons (car leftover) reversed) (cdr leftover))))
  (iter '() collection))


(rec-reverse '(1 2 3))
(rec-reverse '(1))
(rec-reverse '())
(iter-reverse '(1 2 3))
(iter-reverse '(1))
(iter-reverse '())
