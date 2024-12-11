(define (atom? x)
  (not (pair? x)))

; First solution:
; (define (depth-and-leaf-count lst)
;   (cond ((null? lst) (cons 0 0))
;         ((atom? lst) (cons 0 1))
;         (else
;           (let ((left (depth-and-leaf-count (car lst)))
;                 (right (depth-and-leaf-count (cdr lst))))
;             (cons
;               (max (+ (car left) 1) (car right))
;               (+ (cdr left) (cdr right)))))))

; Refactored solution:
(define (depth-and-leaf-count lst)
  (define (result depth count) (cons depth count))
  (define depth car)
  (define count cdr)

  (cond ((null? lst) (cons 0 0))
        ((atom? lst) (cons 0 1))
        (else
          (let ((left (depth-and-leaf-count (car lst)))
                (right (depth-and-leaf-count (cdr lst))))
            (result
              (max (+ 1 (depth left)) (depth right))
              (+ (count left) (count right)))))))

(depth-and-leaf-count '((1 2) ((3 4) 5) (6 7))) ; ; (out) (3 . 7)
