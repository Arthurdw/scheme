(define (make-random m a seed)
  (let ((staat seed))
    (lambda ()
      (set! staat (modulo (* staat a ) m))
      (exact->inexact (/ staat m)))))

(define random (make-random (- (expt 2 32) 1) (expt 7 5) 97))

(random) ; ; (out) 0.3795827234582
(random) ; ; (out) 0.646833161974054
(random) ; ; (out) 0.324953297927266
(random) ; ; (out) 0.490078263564519
(random) ; ; (out) 0.529875182902877
