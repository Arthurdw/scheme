(define (intersperse value collection)
  (define (intersperse-handler collection)
    (if (null? collection)
      collection
      (cons value (cons (car collection) (intersperse-handler (cdr collection))))))
  (if (or (null? collection) (null? (cdr collection)))
    collection
    (cons (car collection) (intersperse-handler (cdr collection)))))

(intersperse 1 '(3 4 5))
(intersperse 1 '(9))
(intersperse 1 '())
