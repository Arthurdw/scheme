(define (iter-sum-lists l r)
  (define (iter collection left right)
    (let ((has-left (pair? left))
          (has-right (pair? right)))
      (cond ((and has-left has-right) (iter (cons (+ (car left) (car right)) collection) (cdr left) (cdr right)))
            (has-left (iter (cons (car left) collection) (cdr left) right))
            (has-right (iter (cons (car right) collection) left (cdr right)))
            (else collection))))
  (reverse (iter '() l r)))


(iter-sum-lists '(1 2 3 4) '(5 6 7))
(iter-sum-lists '(1 2 3 4) '())
(iter-sum-lists '() '(1 2 3))
