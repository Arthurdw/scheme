#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d stack linked) stack:))

(define TAG_PREFIX #\<)
(define TAG_SUFFIX #\>)
(define CLOSING_TAG #\/)

(define (opening-parenthesis? symbol)
  (define tag (symbol->string symbol))
  (eq? (string-ref tag 0) TAG_PREFIX))

(define (closing-parenthesis? symbol)
  (define tag (symbol->string symbol))
  (eq? (string-ref tag (- (string-length tag) 1)) TAG_SUFFIX))

(define (opening-tag? symbol)
  (and
    (opening-parenthesis? symbol)
    (closing-parenthesis? symbol)
    (not (closing-tag? symbol))))

(define (closing-tag? symbol)
  (define tag (symbol->string symbol))

  (and
    (opening-parenthesis? symbol)
    (closing-parenthesis? symbol)
    (eq? (string-ref tag 1) CLOSING_TAG)))

(define (matches? symbol-a symbol-b)
  (define tag-a (symbol->string symbol-a))
  (define tag-b (symbol->string symbol-b))

  (and (opening-tag? symbol-a)
       (closing-tag? symbol-b)
       (equal?
        (substring tag-a 1 (- (string-length tag-a) 1))
        (substring tag-b 2 (- (string-length tag-b) 1)))))

(define (valid? lst)
  (define stack (stack:new))

  (let loop ((current-lst lst))
    (if (null? current-lst)
      (stack:empty? stack)
      (let ((element (car current-lst)))
        (cond 
          ((opening-tag? element) 
            (stack:push! stack element)
            (loop (cdr current-lst)))
          ((closing-tag? element)
           (and (matches? (stack:pop! stack) element)
             (loop (cdr current-lst))))
          (else (loop (cdr current-lst))))))))



(display (opening-tag? '<html>))
(newline)
(display (opening-tag? '</html>))
(newline)
(display (closing-tag? '<html>))
(newline)
(display (closing-tag? '</html>))
(newline)
(display (matches? '<html> '</html>))
(newline)
(display (matches? '<html> '</body))
(newline)
(display (valid? '(<html> <head> This is the head </head> <body> And this is the body </body> </html>)))
(newline)
(display (valid? '(<html> head </head> <body> And this is the body </body> </html>)))

