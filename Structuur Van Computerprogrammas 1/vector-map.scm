; vector-map: ((any -> any) vector -> vector)
(define (vector-map! f vec)
  (do ((i 0 (+ i 1)))
    ((= i (vector-length vec)) 'done)
    (vector-set! vec i (f (vector-ref vec i)))))


; Demo:
(define v (vector 1 2 3 4))
(vector-map! (lambda (x) (* x x)) v)
v ; ; (out) #(1 4 9 16)
