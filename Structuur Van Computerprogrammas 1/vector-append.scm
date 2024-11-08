(define (vector-append vec1 vec2)
  (let* ((size1 (vector-length vec1))
         (size2 (vector-length vec2))
         (result (make-vector (+ size1 size2))))

    (define (result-append! base vec)
      (do ((i base (+ i 1)))
        ((= (- i base) (vector-length vec)) 'done)
        (vector-set! result i (vector-ref vec (- i base)))))

    (begin
      (result-append! 0 vec1)
      (result-append! size1 vec2)
      result)))

(vector-append (vector 1 2 3) (vector 4 5 6 7)) ; ; (out) #(1 2 3 4 5 6 7)
