(define (make-counter initial)
  (define (increase!)
    (set! initial (+ initial 1)))

  (define (decrease!)
    (set! initial (- initial 1)))

  (define (dispatch m)
    (cond ((eq? m 'increase!) increase!)
          ((eq? m 'decrease!) decrease!)
          ((eq? m 'read) initial)
          (else (display "wrong message"))))

  dispatch)

(define (make-parking capacity1 capacity2)
  (define total-space (+ capacity1 capacity2))
  (define used-space (make-counter 0))

  (define (level)
    (if (<= (used-space 'read) capacity1)
      1
      2))

  (define (empty?)
    (= (used-space 'read) 0))

  (define (full?)
    (>= (used-space 'read) total-space))

  (define (car-enters!)
    (if (dispatch 'full?)
      (lambda () #f)
      (used-space 'increase!)))

  (define (car-leaves) (used-space 'decrease!))

  (define (dispatch m)
    (cond ((eq? m 'level) (level))
          ((eq? m 'empty?) (empty?))
          ((eq? m 'full?) (full?))
          ((eq? m 'car-enters!) (car-enters!))
          ((eq? m 'car-leaves!) (car-leaves))))

  dispatch)

(define parking (make-parking 3 5))
 
(parking 'level) ; 1
 
(parking 'full?) ; #f

((parking 'car-enters!))
((parking 'car-enters!))
((parking 'car-enters!))
((parking 'car-enters!))
 
(parking 'level) ; 2

(parking 'empty?) ; #f

((parking 'car-enters!))
((parking 'car-enters!))
((parking 'car-enters!))
((parking 'car-enters!))
 
(parking 'full?) ; #t

((parking 'car-enters!)) ; #f

((parking 'car-leaves!))
((parking 'car-leaves!))
((parking 'car-leaves!))
((parking 'car-leaves!))
((parking 'car-leaves!))
((parking 'car-leaves!))
 
(parking 'level) ; 1
