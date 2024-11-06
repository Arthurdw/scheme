(define (super-merge-n c n)
  (define (consume-n-of-collection collection)
    (define (consumer aggregation leftover index)
      (if (or (not (pair? leftover)) (= index n))
        (cons (reverse aggregation) leftover)
        (consumer (cons (car leftover) aggregation) (cdr leftover) (+ index 1))))

    (consumer '() collection 0))

  (define (iter-over-collections aggregation collections)
    (if (null? collections)
      aggregation
      (let ((processed (consume-n-of-collection (car collections))))
        (if (null? (car processed))
          (iter-over-collections aggregation (cdr collections))
          (iter-over-collections (append aggregation (car processed)) (append (cdr collections) (list (cdr processed))))))))

  (iter-over-collections '() c))

(super-merge-n '((a b c d e f)
                   (g h i j k)
                   (l m n o p q)
                   (r s t u v w))
                 3)
(display "(a b c g h i l m n r s t d e f j k o p q u v w)")
