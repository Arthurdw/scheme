(define (vector-map f vec)
  (let*
    ((size (vector-length vec))
     (result (make-vector size)))
    (do ((i 0 (+ i 1)))
      ((= i size) result)
      (vector-set! result i (f (vector-ref vec i))))))

(vector-map (lambda (x) (* x x)) (vector 1 2 3 4)) ; ; (out) #(1 4 9 16)
