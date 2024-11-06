(define (print-hallo)
  (display "hallo")
  (newline))

(define (make-do-n cb n)
  (lambda ()
    (do ((idx 1 (+ idx 1)))
      ((= idx n) (cb))
      (cb))))

(make-do-n print-hallo 2) ; ; (out) #<procedure (?)>
((make-do-n print-hallo 2)) ; ; (out) hallo

