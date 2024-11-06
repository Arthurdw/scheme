(define (my-and first second)
  (if first second #f))

(my-and #f #t)
(my-and #t #t)
(my-and #t #f)
(my-and #f #f)
