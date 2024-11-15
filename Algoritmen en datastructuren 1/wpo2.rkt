#lang r7rs

(import (scheme base)
        (scheme write))

; Task 2
(define (mystring->number s)
  (define (iterate position res)
    (if (= position (string-length s))
        res
        (iterate (+ position 1)
                 (+ (* res 10) (- (char->integer (string-ref s position)) 48)))))
  (iterate 0 0))

(display (mystring->number "1234"))
(newline)

; Task 3
; v is a prefix of t
; w is a suffix of t
; Yes it is, because it not an empty string nor is it the string itself

; Task 4
; "Hello"
; Prefixes: "", "H", "He", "Hel", "Hell", "Hello"
; Proper Prefixes: "H", "He", "Hel", "Hell"
; Suffixes: "", "o", "lo", "llo", "ello", "Hello"
; Proper Suffixes: "o", "lo", "llo", "ello"

