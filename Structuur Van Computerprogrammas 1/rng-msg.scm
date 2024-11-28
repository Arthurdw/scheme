(define (make-random m a seed)
  (let ((staat seed))
    (define (generate)
      (set! staat (modulo (* staat a ) m))
      (exact->inexact (/ staat m)))

    (define (reset seed)
      (set! staat seed))

    (lambda (cmd)
      (cond ((eq? cmd 'generate) generate)
            ((eq? cmd 'reset) reset)
            (else (display "invalid cuh"))))))

(define random (make-random (- (expt 2 32) 1) (expt 7 5) 99))
((random 'generate))
((random 'generate))
((random 'generate))

((random 'reset) 99)

((random 'generate))
((random 'generate))
((random 'generate))
