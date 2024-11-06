#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (h1 fraction) frac::))

(define f1 (frac::new 1 2))
(define f2 (frac::new 2 4))

(define (frac::= frac1 frac2)
  (= (/ (frac::numer frac1) (frac::denom frac2))
     (/ (frac::numer frac2) (frac::denom frac1))))

(display "you are ")
(display (frac::= f1 f2))
(display "hic")


