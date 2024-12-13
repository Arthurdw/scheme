#lang r7rs

(import (scheme base)
        (scheme write)
        (prefix (a-d tree binary-tree) bt:))

(define testboom 
  (bt:new 1
    (bt:new 2
      (bt:new 3
        bt:null-tree
        bt:null-tree)
      (bt:new 4
        bt:null-tree
        (bt:new 5
          bt:null-tree
          bt:null-tree)))
    (bt:new 6
      bt:null-tree
      bt:null-tree)))

(define (tree-height tree)
  (if (bt:null-tree? tree)
    1
    (let ((left-height (tree-height (bt:left tree))) 
          (right-height (tree-height (bt:right tree))))
      (+ left-height 1)
      (+ right-height 1))))

(display (tree-height testboom))

(define (count-nodes tree)
  (cond ((bt:null-tree? tree) 0)
        (else (+ 1
                 (count-nodes (bt:left tree))
                 (count-nodes (bt:right tree))))))

(define (count-subtrees tree)
  (cond ((bt:null-tree? tree) 0)
        (else (+ (count-nodes (bt:left tree))
                 (count-nodes (bt:right tree))))))
