(define (atom? x)
  (not (pair? x)))

(define (deep-combine op base lst)
  (cond ((null? lst) base)
        ((atom? lst) (op base lst))
        (else (op (deep-combine op base (car lst))
                  (deep-combine op base (cdr lst))))))


(deep-combine + 0 '((((1 2) (3 4)) ((5 6) (7 8))) 9))
; 45
