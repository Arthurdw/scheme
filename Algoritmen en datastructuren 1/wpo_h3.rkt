#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d positional-list double-linked-positional-list) plist:)
        (a-d pattern-matching quicksearch))

(define-record-type
  headed-list
  (new h v l)
  headed-list?
  (h get-h set-h!)
  (v get-v set-v!)
  (l get-l set-l!))

(define hl (let ((last (list 7))
                 (l '(-5 -8 -1 6 2 0)))
  (new last 3 (append l last))))

(define (plist-display l)
  (plist:for-each l (lambda (el)
                      (display el)
                      (display #\space)))
  (newline))

(define l (plist:new string=?))
(plist:add-before! l "and")
(plist:add-after! l "me")
(plist:add-after! l "to" (plist:first l))
(plist:add-after! l "goodday" (plist:first l))
(plist:add-before! l "hello")
(plist:add-after! l "world" (plist:first l))

(plist-display l)

(define (count l)
  (define ctr 0)
  (plist:for-each l (lambda (e)
                      (if (match e "e")
                          (set! ctr (+ ctr 1))))))

;;; oef 3
(define (pair-eq? p1 p2)
  (eq? (cdr p1)
       (cdr p2)))

(define m (plist:map l (lambda (el)
                         (cons el (string-length el)))
                     pair-eq?))

(display (plist:find m (cons 'vdjnslvdbsjklb 7)))
