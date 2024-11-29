#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d stack linked) stack:))

(define (stack-to-list buffer)
  (let loop
    ((acc '()))
    (if (stack:empty? buffer)
      acc
      (loop (cons (stack:pop! buffer) acc)))))

(define (postfix-eval lst)
  (define buffer (stack:new))

  (let loop ((stmt lst))
    (cond
      ((null? stmt) (stack:pop! buffer))
      ((procedure? (car stmt))
        (stack:push! buffer (apply (car stmt) (stack-to-list buffer)))
        (loop (cdr stmt)))
      (else
        (stack:push! buffer (car stmt))
        (loop (cdr stmt))))))

(display (postfix-eval (list 5 6 +)))
(newline)
(display (postfix-eval (list 5 6 + 7 -)))
(newline)
(display (postfix-eval (list 5 6 7 + 4 5 6 4 -)))
