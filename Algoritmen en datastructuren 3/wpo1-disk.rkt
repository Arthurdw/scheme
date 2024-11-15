#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d disk disk) disk:))

;(define dsk
;  (disk:new "/tmp/toydisk.disk"))
;; 
;; (define dsk
;;   (disk:mount "/tmp/toydisk.disk"))
;; (define blk (disk:read-block dsk 7))
;; (disk:encode-byte! blk 20 212)
;; (disk:write-block! blk)
;; (disk:unmount dsk)

(define test (vector 1 2 3 4 5 6 7 8 9 0))

(define (block-vector-set! contents offs nmbr endian size)
  (cond ((eq? endian 'little)
         (do ((i 0 (+ i 1))
              (number nmbr (quotient number 256)))
           ((= i size) bytevector)
           (vector-set! contents (+ offs i) (modulo number 256))))
        ((eq? endian 'big) contents)
        (else contents))) ; unknown endian

(define (block-vector-ref contents offs endian size)
  (cond ((eq? endian 'little) contents) ; TODO: do decoding
        ((eq? endian 'big) contents)
        (else contents))) ; unknown endian

(define (block-vector-int-set! contents offs nmbr endian size)
  (cond ((eq? endian 'little) )
        ((eq? endian 'big) contents)
        (else contents))) ; unknown endian

(display test)
(newline)
(block-vector-set! test 3 1234567 'little 3)
(display test)
