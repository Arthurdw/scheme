(define (hofstadter-reeksen x)
  (define (hofstadter-V n)
    (cond ((= n 0) 1)
          ((> n 0) (- n (hofstadter-M (hofstadter-V (- n 1)))))))

  (define (hofstadter-M n)
    (cond ((= n 0) 0)
          ((> n 0) (- n (hofstadter-V (hofstadter-M (- n 1)))))))

  (do ((i 0 (+ i 1)))
      ((>= i x))
    (begin
      (display (string-append (number->string (hofstadter-V i)) " " (number->string (hofstadter-M i))))
      (newline))))

(hofstadter-reeksen 10)
