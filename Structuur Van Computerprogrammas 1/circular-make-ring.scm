(define (make-ring! start)
  (define ring '())
  (do ((i start (- i 1)))
    ((= i 0)
     (let* ((last (cons i '())))
       (set! ring (append ring last))
       (set-cdr! last ring)
       ring))
    (set! ring (append ring (list i)))))

; other way
; (define (make-ring! n)
;   (let ((last (cons 0 '())))
;     (define (make-lst i)
;       (if (= i 0)
;         last
;         (cons i (make-lst (- i 1)))))
;     (let ((lst (make-lst n)))
;           (set-cdr! last lst)
;           lst)))

(define (print-ring r)
  (define (aux l)
    (if (not (null? l))
        (cond ((eq? (cdr l) r) (display " ")
                               (display (car l))
                               (display "..."))
              (else (display " ")
                    (display (car l))
                    (aux (cdr l))))))
  (aux r))


(define r (make-ring! 3))
(print-ring r) ; ; (out) 3 2 1 0...
(print-ring (cdr r)) ; ; (out) 2 1 0 3...
