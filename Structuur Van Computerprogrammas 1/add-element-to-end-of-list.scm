(define (add-to-end e l)
  (if (null? l)
    (list e)
    (cons (car l) (add-to-end e (cdr l)))))

(add-to-end 999 '())
(add-to-end 999 '(1))
