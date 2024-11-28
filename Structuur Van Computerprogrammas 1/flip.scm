(define flip
  (let ((staat 0))
    (lambda ()
      (if (= staat 0)
        (set! staat 1)
        (set! staat 0))
      staat)))

(flip) ; ; (out) 1
(flip) ; ; (out) 0
(flip) ; ; (out) 1
(flip) ; ; (out) 0



(define (make-flip)
  (let ((staat 0))
    (lambda ()
      (if (= staat 0)
        (set! staat 1)
        (set! staat 0))
      staat)))

(define flipper (make-flip))
(flipper) ; ; (out) 1
(flipper) ; ; (out) 0
(flipper) ; ; (out) 1
