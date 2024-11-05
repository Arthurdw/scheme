(define (zip l1 l2 op)
  (let iter ((acc '()) (left l1) (right l2))
    (if (or (null? left) (null? right))
      (reverse acc)
      (iter (cons (op (car left) (car right)) acc) (cdr left) (cdr right)))))


(zip '(1 2 3 4) '(5 6 7 8) +) ; ; (out) (6 8 10 12)
(zip '(1 2 3 4) '(5 6 7 8) -) ; ; (out) (-4 -4 -4 -4)
