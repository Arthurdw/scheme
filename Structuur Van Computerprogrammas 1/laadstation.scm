(define (maak-laadstation)
  (let ((coupled-car '())
        (power-used 0))

    (define (withdraw! n)
      (cond
        ((vrij?) (display "no car is coupled!"))
        ((< n 0) (display "can't supply power to a power station"))
        (else (set! power-used (+ power-used n)))))

    (define (koppel! auto)
      (if (vrij?)
        (set! coupled-car auto)
        (display "already in use")))

    (define (ontkoppel!)
      (if (vrij?)
        (display "no car present")
        (set! coupled-car '())))

    (define (vrij?)
      (null? coupled-car))

    (lambda (cmd)
      (cond ((eq? cmd 'withdraw!) withdraw!)
            ((eq? cmd 'koppel!) koppel!)
            ((eq? cmd 'ontkoppel!) ontkoppel!)
            ((eq? cmd 'vrij?) vrij?)))))

(define laadstation (maak-laadstation))

((laadstation 'vrij?))
((laadstation 'withdraw!) 40)
(newline)
((laadstation 'ontkoppel!))
(newline)
((laadstation 'koppel!) 'my-car)
((laadstation 'vrij?))
((laadstation 'withdraw!) 40)
((laadstation 'ontkoppel!))
