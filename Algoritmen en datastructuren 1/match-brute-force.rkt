#lang r7rs

(import (scheme base))


(define (match t p)
  (define n-t (string-length t))
  (define n-p (string-length p))
  (define matches '())
  (define last-ref matches)

  (let loop
    ((i-t 0)
     (i-p 0)
     (res '()))
    (cond
      ((> i-p (- n-p 1)) (loop (+ i-t 1) 0 (cons i-t res)))
      ((> i-t (- n-t n-p)) res)
      ((eq? (string-ref t (+ i-t i-p)) (string-ref p i-p))
        (loop i-t (+ i-p 1) res))
      (else
        (loop (+ i-t 1) 0 res)))))

(match "bababxzy" "bab")



