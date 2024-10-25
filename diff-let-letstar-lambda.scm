; (let ((x 2)
;       (y (+ x 8))
;       (z (/ y x)))
;   (+ x y z))
; NOT VALID SYNTAX
; (lambda (
;           x // 2
;           y // (+ x 8) !! x does not exists here
;           z // (/ y x) !! y and x don't exist here
;         )
;         (+ x y z)
(lambda (x y z) (+ x y z))

; (let* ((x 2)
;        (y (+ x 8))
;        (z (/ y x)))
;   (+ x y z))
((lambda (x)
  ((lambda (y)
    ((lambda (z) (+ x y z))
      (/ y x)))
    (+ x 8)))
  2)
