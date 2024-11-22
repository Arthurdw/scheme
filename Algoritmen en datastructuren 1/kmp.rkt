; KMP as the lectors want it
#lang r7rs

(import (scheme base)
        (scheme write))

(define (compute-failure-function pattern)
  (define n-pattern (string-length pattern))
  (define sigma-table (make-vector n-pattern 0))
  (let loop
    ((i-pattern 2)
      (k 0))
    (when (< i-pattern n-pattern)
        (cond
          ((eq? (string-ref pattern k) 
                (string-ref pattern (- i-pattern 1)))
            (vector-set! sigma-table i-pattern (+ k 1))
            (loop (+ i-pattern 1) (+ k 1)))
          ((> k 0)
            (loop i-pattern (vector-ref sigma-table k)))
          (else ; k=0
            (vector-set! sigma-table i-pattern 0)
            (loop (+ i-pattern 1) k))))
    (vector-set! sigma-table 0 -1)
    (lambda (q)
      (vector-ref sigma-table q))))

(define (match t pattern)
  (define n-t (string-length t))
  (define n-pattern (string-length pattern))
  (define sigma (compute-failure-function pattern))
  (let loop
    ((i-t 0)
    (i-pattern 0)) 
    (cond 
      ((> i-pattern (- n-pattern 1))
      i-t)
      ((> i-t (- n-t n-pattern))
      #f)
      ((eq? (string-ref t (+ i-t i-pattern)) (string-ref pattern i-pattern))
      (loop i-t (+ i-pattern 1)))
      (else
      (loop (+ i-t (- i-pattern (sigma i-pattern))) (if (> i-pattern 0)
                                          (sigma i-pattern)
                                          0))))))

(display (match "ABC ABCDAB ABCDABCDABDE" "ABCDABD"))
