(define (hofstadter-V n)
  (cond ((= n 0) 1)
        ((> n 0) (- n (hofstadter-M (hofstadter-V (- n 1)))))))

(define (hofstadter-M n)
  (cond ((= n 0) 0)
        ((> n 0) (- n (hofstadter-V (hofstadter-M (- n 1)))))))

(hofstadter-V 7)
(hofstadter-M 7)
