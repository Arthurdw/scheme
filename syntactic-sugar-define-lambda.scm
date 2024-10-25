(define f 5)
; > f
; 5

(define (f) 5)
; > (f)
; 5

(define (f _) 5)
; > (f 3)
; 5

(define (f)
  (lambda () 5)
; > ((f))
; 5

(define (f _)
  (lambda () (lambda () 5)))
; > (((f)) 3)
; 5
