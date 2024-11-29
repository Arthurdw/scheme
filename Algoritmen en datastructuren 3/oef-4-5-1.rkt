#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d stack linked) stack:))

(define (stack-to-list buffer)
  (if (stack:empty? buffer)
    '()
    (cons (stack:pop! buffer) (stack-to-list buffer))))

(define (postfix-eval lst)
  (let loop
    ((stmt lst)
     (buffer (stack:new)))

    (cond
      ((null? stmt) (stack:pop! buffer))
      ((procedure? (car stmt))
        (stack:push! buffer (apply (car stmt) (reverse (stack-to-list buffer))))
        (loop (cdr stmt) buffer))
      (else
        (stack:push! buffer (car stmt))
        (loop (cdr stmt) buffer)))))

(display (postfix-eval (list 5 6 +)))
(newline)
(display (postfix-eval (list 5 6 + 7 -)))
(newline)
(display (postfix-eval (list 5 6 7 + 4 5 6 4 -)))
