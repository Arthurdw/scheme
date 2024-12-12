; Leaving this here for legacy poopoo
; (define (cycles? lst)
;   (define has-passed-ptr?
;     (let ((passed-ptrs (list 'headed)))
;       (lambda (ptr)
;         (let loop ((rem passed-ptrs))
;           (cond ((null? rem)
;                  (set! passed-ptrs (cons ptr passed-ptrs))
;                  #f)
;                 ((memq ptr rem) #t)
;                 (else (loop (cdr rem))))))))
;
;   (let loop ((rem lst))
;     (cond ((null? rem) #f)
;           ((has-passed-ptr? (cdr rem)) #t)
;           (else (loop (cdr rem))))))

; Hot new clean proper code lets goo!!!
(define (cycles? lst)
  (define (has-cycle? seen remaining)
    (cond ((null? remaining) #f)
          ((memq (cdr remaining) seen) #t)
          (else (has-cycle? (cons (cdr remaining) seen) (cdr remaining)))))

  (has-cycle? '() lst))

(cycles? '()) ; ; (out) #f
(cycles? '(1 2 3)) ; ; (out) #f

(define car-loop
    (let ((first (cons 'a '())))
      (set-car! first first)
      first))
(cycles? car-loop) ; ; (out) #f

(define ring
    (let* ((last (cons '3 '()))
           (list (cons 1 (cons 2 last))))
      (set-cdr! last list)
      list))
(cycles? ring) ; ; (out) #t

(define headed-ring (cons 'headed ring))
(cycles? headed-ring) ; ; (out) #t
