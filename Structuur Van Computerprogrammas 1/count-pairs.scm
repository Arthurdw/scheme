(define (count-pairs lst)
  (define (counter count seen remaining)
    (if (or (null? remaining) (memq (cdr remaining) seen))
      count
      (counter (+ 1 count) (cons (cdr remaining) seen) (cdr remaining))))

  (counter 0 '() lst))

(define ret3 (cons 'a (cons 'b (cons 'c '()))))
(count-pairs ret3) ; ; (out) 3

(define ret4
  (let ((last (cons 'c '())))
    (cons last (cons 'b last))))
(count-pairs ret4) ; ; (out) 3

(define ret7
  (let* ((last (cons 'c '()))
          (middle (cons last last)))
    (cons middle middle)))
(count-pairs ret7) ; ; (out) 3

(define retno
  (let* ((last (cons 'c '()))
          (lst (cons 'a (cons 'b last))))
    (set-cdr! last lst)
    lst))
(count-pairs retno) ; ; (out) 3
