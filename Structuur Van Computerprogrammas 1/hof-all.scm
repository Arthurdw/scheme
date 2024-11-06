(define (all? pred? l)
  (if (null? l) #t
    (if (not (pred? (car l))) #f
      (all? pred? (cdr l)))))

(all? even? '(2 4 6 8)) ; ; (out) #t
(all? even? '(2 3 4 5)) ; ; (out) #f
