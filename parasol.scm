(define (get-n str amount)
  (if (<= amount 0)
    ""
    (do ((i amount (- i 1))
        (concat str (string-append concat str)))
      ((= i 1) concat))))

(define (get-parasol-width n) (- (* n 2) 1))

(define (get-parasol-line blocks width)
  (define spaces (quotient (- width blocks) 2))
  (string-append (get-n " " spaces) (get-n "*" blocks) "\n"))

(define (get-parasol-section n width getter)
  (do ((i 0 (+ i 1))
       (hood "" (string-append hood (get-parasol-line (getter i) width))))
      ((= i n) hood)))

(define (get-parasol n)
  (define width (get-parasol-width n))
  (string-append
    (get-parasol-section n width (lambda (i) (+ (* i 2) 1)))
    (get-parasol-section 3 width (lambda (i) 1))))

(define (parasol n) (display (get-parasol n)))

(parasol 5)
