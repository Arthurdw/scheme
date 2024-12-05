(define (atom? x)
  (not (pair? x)))

(define (same-structure? left right)
  (if (or (atom? left) (atom? right))
      (and (atom? left) (atom? right))
      (and (same-structure? (car left) (car right))
           (same-structure? (cdr left) (cdr right)))))

(same-structure? '((1 2) ((3 . 4) ((5 6) ((7 8) (9)))))
                 '((a b) ((c . d) ((e f) ((g h) (i)))))) ; ; (out) #t

(same-structure? '((1 2) ((3 4) ((5 6) ((7 8) (9)))))
                 '((((1 2) (3 4)) ((5 6) (7 8))) 9)) ; ; (out) #f
