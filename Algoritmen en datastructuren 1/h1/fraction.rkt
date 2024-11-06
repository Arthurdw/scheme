#lang r7rs

(define-library (fraction)
  ; We want to export these values:
  (export new numer denom fraction? + - * /)

  (import (rename (scheme base) 
                  (+ std::+)
                  (- std::-)
                  (* std::*)
                  (/ std::/))
          (scheme write))

  (begin
    ; new: (number number -> fraction)
    ; numer: (fraction -> number)
    ; denom (fraction -> number)
    ; fraction? (fraction -> boolean)
    (define-record-type fraction
      (make-frac n d)
      fraction?
      (n numer)
      (d denom))

    (define (new n d)
      (define devider (gcd n d))
      (make-frac (std::/ n devider) (std::/ d devider)))

    ; +: (fraction fraction -> fraction)
    (define (+ left right)
      (new (std::+ (std::* (numer left) (denom right)) 
                   (std::* (numer right) (denom left)))
           (std::* (denom left) (denom right))))

    ; -: (fraction fraction -> fraction)
    (define (- left right)
      (new (std::- (std::* (numer left) (denom right)) 
                   (std::* (numer right) (denom left)))
           (std::* (denom left) (denom right))))

    ; *: (fraction fraction -> fraction)
    (define (* left right)
      (new (std::* (numer left) (numer right)) 
           (std::* (denom left) (denom right))))

    ; /: (fraction fraction -> fraction)
    (define (/ left right)
      (new (std::* (numer left) (denom right)) 
           (std::* (denom left) (numer right))))))
