#lang r7rs

(import (scheme base)
        (scheme write))

(define INVALID_NEEDLE -1)

(define (get-lps needle)
  (define lps (make-vector (string-length needle) 0))

  (let loop ((i 1) (prev-lps 0))
    (cond ((= i (string-length needle)) lps)
          ((eq? (string-ref needle i) (string-ref needle prev-lps))
           (begin
             (vector-set! lps i (+ prev-lps 1))
             (loop (+ i 1) (+ prev-lps 1))))
          ((= prev-lps 0)
           (begin
             (vector-set! lps i 0)
             (loop (+ i 1) prev-lps)))
          (else (loop i (vector-ref lps (- prev-lps 1)))))))

(define (kmp haystack needle)
  (define lps (get-lps needle))

  (let loop ((haystack-i 0) (needle-i 0))
    (cond ((= needle-i (string-length needle)) (- haystack-i (string-length needle)))
          ((= haystack-i (string-length haystack)) INVALID_NEEDLE)
          ((eq? (string-ref haystack haystack-i) (string-ref needle needle-i))
           (loop (+ haystack-i 1) (+ needle-i 1)))
          ((= needle-i 0) (loop (+ haystack-i 1) 0))
          (else (loop haystack-i (vector-ref lps (- needle-i 1)))))))

(define (match haystack needle)
  (if (> (string-length needle) (string-length haystack))
      INVALID_NEEDLE
      (kmp haystack needle)))

(display (match "hello" "aaaaax")) ; -1
(display (match "hello" "ll")) ; 2
(display (match "potato salad is pretty jummy for the tummy" "mmy")) ; 25
