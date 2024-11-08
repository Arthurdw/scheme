#lang r7rs

(import (scheme base))

; Worst case: Theta(n)
;  Best case: O(1)
(define (last-of-list lst)
  (cond ((null? lst) #f)
        ((null? (cdr lst)) (car lst))
        (else (last-of-list (cdr lst)))))

(last-of-list (list 1 2 3 4 5)) ; 5

; Worst case: O(1)
;  Best case: O(1)
(define (last-of-vector vec)
  (if (< (vector-length vec) 1)
    #f
    (vector-ref vec (- (vector-length vec) 1))))

(last-of-vector (vector 1 2 3 4 5)) ; 5
