; See ./hof-zip.scm
(define (zip l1 l2 op)
  (let iter ((acc '()) (left l1) (right l2))
    (if (or (null? left) (null? right))
      (reverse acc)
      (iter (cons (op (car left) (car right)) acc) (cdr left) (cdr right)))))

(define (sum-of-squares l1 l2)
  (define (square n) (* n n))
  (zip l1 l2 (lambda (x y) (+ (square x) (square y)))))

(sum-of-squares '(1 2 3 4) '(5 6 7 8)) ; ; (out) (26 40 58 80)
