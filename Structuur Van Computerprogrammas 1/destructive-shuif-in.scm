(define (schuif-in! lst1 lst2)
  (if (null? (cdr lst1))
    (begin
      (set-cdr! lst1 lst2)
      'ok)
    (begin
      (set-cdr! lst1 (cons (car lst2) (cdr lst1)))
      (schuif-in! (cddr lst1) (cdr lst2)))))


(define lijst1 '(1 3 5))
(define lijst2 '(2 4 6 8))
(schuif-in! lijst1 lijst2) ; ; (out) ok
lijst1 ; ; (out) (1 2 2 4 3 6 4 8 5 6 8)
