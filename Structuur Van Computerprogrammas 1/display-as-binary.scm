(define (get-bit x)
  (if (even? x) "0" "1"))

(define (get-as-binary n)
  (define (getter n ctr)
    (define bit (get-bit n))
    (cond ((and (= n 0) (> ctr 0)) "")
          ((= n 0) bit)
          (else (string-append (getter (quotient n 2) (+ ctr 1)) bit))))
  (getter n 0))

(define (display-as-binary n) (display (get-as-binary n)))

(display-as-binary 8)
(display-as-binary 5)
(display-as-binary 0)
