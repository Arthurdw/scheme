(define (vector-slice start end vec)
  (define result (make-vector (+ (- end start) 1)))
  (do ((i start (+ i 1)))
    ((> i end) result)
    (vector-set! result (- i start) (vector-ref vec i))))

(vector-slice 2 6 (vector 0 1 2 3 4 5 6 7 8 9)) ; ; (out) #(2 3 4 5 6)
(vector-slice 3 3 (vector 0 1 2 3 4 5 6 7 8 9)) ; ; (out) #(3)
(vector-slice 4 5 (vector "the" "quick" "brown" "fox" "jumps" "over" "the" "lazy" "dog")) ; ; (out) #("jumps" "over")
