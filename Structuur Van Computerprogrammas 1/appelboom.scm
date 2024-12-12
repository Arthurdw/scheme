(define (blad? boom) (eq? boom 'blad))
(define (appel? boom) (and (pair? boom) (eq? (car boom) 'appel)))
(define (appel-type boom) (cdr boom))

(define boom
  '((blad (appel . golden))
    (blad (appel . granny))
    (((appel . golden) blad) blad (appel . cox))))

(define (leafs boom)
  (cond ((null? boom) 0)
        ((appel? boom) 0)
        ((blad? boom) 1)
        (else (+ (leafs (car boom))
                 (leafs (cdr boom))))))

(define (all-apples boom)
  (cond ((null? boom) '())
        ((blad? boom) '())
        ((appel? boom) (list (appel-type boom)))
        (else (append (all-apples (car boom))
                      (all-apples (cdr boom))))))

(define (union l1 l2)
  (cond ((null? l1) l2)
        ((member (car l1) l2) (union (cdr l1) l2))
        (else (cons (car l1) (union (cdr l1) l2)))))

(define (apple-types boom)
  (cond ((null? boom) '())
        ((blad? boom) '())
        ((appel? boom) (list (appel-type boom)))
        (else (union (apple-types (car boom)) 
                     (apple-types (cdr boom))))))

(define (bewerk-boom boom doe-blad doe-appel combiner init)
  (cond ((null? boom) init)
        ((blad? boom) (doe-blad boom))
        ((appel? boom) (doe-appel boom))
        (else (combiner (bewerk-boom (car boom) doe-blad doe-appel combiner init)
                        (bewerk-boom (cdr boom) doe-blad doe-appel combiner init)))))

(define (leafs-dmv-bewerk boom)
  (bewerk-boom boom (lambda (blad) 1) (lambda (appel) 0) + 0))

(define (all-apples-dmv-bewerk boom)
  (bewerk-boom boom (lambda (blad) '()) (lambda (appel) (list (appel-type appel))) append '()))

(leafs boom) ; ; (out) 4
(all-apples boom) ; ; (out) (golden granny golden cox)
(apple-types boom) ; ; (out) (granny golden cox)
(leafs-dmv-bewerk boom) ; ; (out) 4
(all-apples-dmv-bewerk boom) ; ; (out) (golden granny golden cox)
