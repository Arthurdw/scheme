(define (my-if check true false)
  (cond (check true)
        (else false)))

(my-if #t 1 2)
(my-if #f 1 2)
