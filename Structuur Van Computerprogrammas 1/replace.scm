(define (replace search value collection)
  (if (null? collection)
    collection
    (cons
      (if (equal? (car collection) search)
        value
        (car collection))
      (replace search value (cdr collection)))))

(replace 1 999 '(1 2 1 3 1 4 1 5 1))
(replace 1 999 '(2 3 4 5 6 7))
(replace 1 999 '(1))
(replace 1 999 '())
