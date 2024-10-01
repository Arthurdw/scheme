; This is a method to get the exact square root of a number using binary search.
; Why? I was just wondering if this was a valid way of working :)

(define (binary-search-sqrt n)
  (define current-min 0.0)
  (define current-max (/ n 2.0))
  (define (** n) (* n n))
  (define (get-middle x y) (+ x (/ (- y x) 2)))
  (define (get-next) (binary-search (get-middle current-min current-max)))
  (define (binary-search x)
    (define squared (** x))
    (cond ((= squared n) x)
          ((< squared n)
           (begin
              (set! current-min x)
              (get-next)))
          (else
            (begin
              (set! current-max x)
              (get-next)))))

  (binary-search (get-middle current-min current-max)))

; Examples:
(binary-search-sqrt 144)
(binary-search-sqrt 64)
(binary-search-sqrt 20)

