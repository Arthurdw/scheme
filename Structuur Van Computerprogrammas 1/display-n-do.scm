(define (get-n str amount)
  (if (= amount 0)
    ""
    (do ((i amount (- i 1))
        (concat str (string-append concat str)))
      ((= i 1) concat))))

(define (display-n str amount)
  (display (get-n str amount)))

(display-n "*" 4)
(display-n "*" 0)
