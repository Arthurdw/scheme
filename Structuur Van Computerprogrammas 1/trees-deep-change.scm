(define (atom? x)
  (not (pair? x)))

; Deep map from ./tries-deep-map.scm
(define (deep-map op lst)
  (cond ((null? lst) '())
        ((atom? lst) (op lst))
        (else (cons (deep-map op (car lst))
                    (deep-map op (cdr lst))))))

(define (deep-change target replacement lst)
  (deep-map
    (lambda (x)
      (if (eq? target x)
        replacement
        x))
    lst))

(deep-change 3 999 '((((1 . 2) (3 4)) ((5 6) (7 8))) . 9)) ; ; (out) ((((1 . 2) (999 4)) ((5 6) (7 8))) . 9)
