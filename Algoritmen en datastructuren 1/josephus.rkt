#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d queue list) queue:))

(define (queue->list! queue)
  (define acc (list 'header))

  (let loop ((curr acc))
    (when (not (queue:empty? queue))
      (let ((item (queue:serve! queue)))
        (set-cdr! curr (list item))
        (loop (cdr curr)))))

  (cdr acc))

(define (list->queue lst)
  (define queue (queue:new))

  (let loop ((fill lst))
    (when (not (null? fill))
      (queue:enqueue! queue (car fill))
      (loop (cdr fill))))

  queue)

(define (josephus lst m)
  (define queue (list->queue lst))

  (let loop ((ctr 1) (winner '()))
    (cond
      ((queue:empty? queue) winner)
      ((= ctr m) (loop 1 (queue:serve! queue)))
      #| To see progress, uncomment this and comment the line above this. |#
      #| ((= ctr m) |#
      #|   (let ((selected (queue:serve! queue))) |#
      #|     (set! queue (display-queue queue)) |#
      #|     (loop 1 selected))) |#
      (else
        (let ((selected (queue:serve! queue)))
          (queue:enqueue! queue selected)
          (loop (+ ctr 1) selected))))))

(display "the winner is ")
(display (josephus '(a b c d e) 3))
