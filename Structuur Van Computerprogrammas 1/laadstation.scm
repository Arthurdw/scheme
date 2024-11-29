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

(define (maak-auto capacity)
  (let ((battery capacity)
        (laadstation '()))
    
    (define (charge)
      (* (/ battery capacity) 100))

    (define (charge!)
      (if (gekoppeld?)
        (begin
          ((laadstation 'withdraw!) (- capacity battery))
          (set! battery capacity))
        (display "koppel eerst de auto voor je hem oplaad")))

    (define (gekoppeld?)
      (not (null? laadstation)))

    (define (koppel! station)
      (if (gekoppeld?)
        (display "ontkoppel eerst de auto voor je hem opnieuw wilt koppelen")
        (begin
          (set! laadstation station)
          ((laadstation 'koppel!) dispatch))))

    (define (ontkoppel!)
      (if (gekoppeld?)
        (begin
          ((laadstation 'ontkoppel!))
          (set! laadstation '()))
        (display "koppel eerst de auot voor je hem wenst te ontkoppelen")))

    (define (dispatch cmd)
      (cond ((eq? cmd 'charge) charge)
            ((eq? cmd 'charge!) charge!)
            ((eq? cmd 'gekoppeld?) gekoppeld?)
            ((eq? cmd 'koppel!) koppel!)
            ((eq? cmd 'ontkoppel!) ontkoppel!)))

    dispatch))

(define (maak-laadpark amount)
  (let ((parks (make-vector amount)))

    (define (next-free)
      (let loop ((idx 0))
        (cond ((((vector-ref parks idx) 'vrij?)) idx)
              ((= idx (- (vector-length parks) 1)) #f)
              (else (loop (+ idx 1))))))

    (define (full?)
      (not (next-free)))

    (define (enter! auto)
      (define idx (next-free))
      (and idx (((vector-ref parks idx) 'koppel!) auto)))

    (do ((i 0 (+ i 1)))
      ((= amount i))
      (vector-set! parks i (maak-laadstation)))

    (lambda (cmd)
      (cond ((eq? cmd 'full?) full?)
            ((eq? cmd 'enter!) enter!)))))


(define laadstation (maak-laadstation))
((laadstation 'vrij?)) ; ; (out) #t
((laadstation 'withdraw!) 40) ; ; (out) no car is coupled!
((laadstation 'ontkoppel!)) ; ; (out) no car present
((laadstation 'koppel!) 'my-car) ; ; (out) 
((laadstation 'vrij?)) ; ; (out) #f
((laadstation 'withdraw!) 40) ; ; (out) 
((laadstation 'ontkoppel!)) ; ; (out) 

(define mijn-auto (maak-auto 70))
((mijn-auto 'charge)) ; ; (out) 100
((mijn-auto 'charge!)) ; ; (out) koppel eerst de auto voor je hem oplaad
((mijn-auto 'koppel!) laadstation) ; ; (out) 
((mijn-auto 'charge)) ; ; (out) 100
((mijn-auto 'charge!)) ; ; (out) 
((mijn-auto 'ontkoppel!)) ; ; (out) 


(define mijn-auto2 (maak-auto 70))
(define mijn-auto3 (maak-auto 70))

(define mijn-laadpark (maak-laadpark 2))
((mijn-laadpark 'full?)) ; ; (out) #f
((mijn-laadpark 'enter!) mijn-auto) ; ; (out) #t
((mijn-laadpark 'full?)) ; ; (out) #f
((mijn-laadpark 'enter!) mijn-auto2) ; ; (out) #t
((mijn-laadpark 'full?)) ; ; (out) #t
((mijn-laadpark 'enter!) mijn-auto3) ; ; (out) #f
((mijn-laadpark 'full?)) ; ; (out) #t

