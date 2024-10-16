(define (last collection)
  (if (null? collection)
    #f
    (if (null? (cdr collection))
      (car collection)
      (last (cdr collection)))))

(last '(1 2 3))
(last '(1))
(last '())
