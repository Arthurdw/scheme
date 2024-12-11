(define (atom? x)
  (not (pair? x)))

(define (deep-map op lst)
  (cond ((null? lst) '())
        ((atom? lst) (op lst))
        (else (cons (deep-map op (car lst))
                    (deep-map op (cdr lst))))))

(define (deep-combine op base lst)
  (cond ((null? lst) base)
        ((atom? lst) (op base lst))
        (else (op (deep-combine op base (car lst))
                  (deep-combine op base (cdr lst))))))

(define (deep-atom-member? e l)
  (deep-combine (lambda (l r) (or l r))
                #f
                (deep-map (lambda (el) (eq? e el)) l)))

(define (count-atoms l)
  (deep-combine + 0 (deep-map (lambda (el) 1) l)))


(deep-atom-member? 3 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9)) ; ; (out) #t
(deep-atom-member? 999 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9)) ; ; (out) #f

(count-atoms '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9)) ; ; (out) 9
