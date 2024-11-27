#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d sorted-list vectorial) slist:))

(define slst (slist:from-scheme-list '(0 1 2 3 4 5 6 7 8 9) < =))


; ; My Implementation
; (define (ternary-search! slst key)
;   (define ==? (equality slst))
;   (define <<? (lesser slst))
;   (define vect (storage slst))
;   (define leng (size slst))
;
;   (let search
;     ((left 0)
;       (right (- leng 1)))
;       (if (<= left right)
;         (let* ((distance (quotient (- right left) 3))
;               (a (+ left distance))
;               (b (- right distance)))
;           (cond
;             ((==? (vector-ref vect a) key) (current! slst a))
;             ((==? (vector-ref vect b) key) (current! slst b))
;             ((<<? key (vector-ref vect a)) (search left (- a 1)))
;             ((<<? (vector-ref vect b) key) (search (+ b 1) right))
;             (else (search (+ a 1) (- b 1)))))
;         (current! slst -1)))
;   slst)

(slist:ternary-search! slst 5)
(display (slist:peek slst)) ;; 5
