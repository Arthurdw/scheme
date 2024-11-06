; This is recursive, not iterative
; (define (my-append acc next)
;   (if (null? acc)
;     next
;     (cons (car acc) (my-append (cdr acc) next))))

; This is iterative
(define (my-append left right)
  (define (iter acc next)
    (if (null? next)
        acc
      (iter (cons (car next) acc) (cdr next))))
  
  (cond ((null? left) right)
        ((null? right) left)
        (else (reverse (iter (reverse left) right)))))

(my-append '(1 2 3) '(4 5))
(my-append '(1 2 3) '())
(my-append '() '(1 2 3))
(my-append '() '())
