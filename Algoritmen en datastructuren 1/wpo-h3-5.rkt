#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d positional-list double-linked-positional-list) plist:))

(define (intersection p1 p2)
  (define result (plist:new eq?))
  (plist:for-each p1
    (lambda (item)
      (if (plist:find p2 item)
        (plist:add-after! result item))))
  result)

(display (intersection (plist:from-scheme-list '(2 4 5 6 7 8) =)
                       (plist:from-scheme-list '(1 3 5 7 9) =)))
