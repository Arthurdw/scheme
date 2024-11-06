(define (my-or first second)
  (if first #t second))

(my-or #t #f)
(my-or #t #t)
(my-or #f #t)
(my-or #f #f)
