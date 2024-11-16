#lang r7rs

(import (scheme base)
        (scheme write))

(define (match haystack needle)
  (define haystack-l (string-length haystack))
  (define needle-l (string-length needle))

  (let loop ((haystack-i 0) (needle-i 0) (res '()))
    (cond ((> needle-i (- needle-l 1)) (loop (+ haystack-i 1) 0 (cons haystack-i res)))
          ((> haystack-i (- haystack-l needle-l)) (reverse res))
          ((eq? (string-ref haystack (+ haystack-i needle-i)) (string-ref needle needle-i)) (loop haystack-i (+ needle-i 1) res))
          (else (loop (+ haystack-i 1) 0 res)))))

(display (match "hello" "ll"))
(newline)
(display (match "potato salad is pretty jummy for the tummy" "mmy"))
