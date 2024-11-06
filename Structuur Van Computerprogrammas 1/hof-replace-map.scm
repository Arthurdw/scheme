(define (replace-dmv-map target value lst)
  (map (lambda (item)
         (if (eq? target item)
           value
           item))
       lst))


(replace-dmv-map 1 999 '(1 2 1 3 1 4 1 5 1)) ; ; (out) (999 2 999 3 999 4 999 5 999)
(replace-dmv-map 1 999 '(2 3 4 5 6 7)) ; ; (out) (2 3 4 5 6 7)
(replace-dmv-map 1 999 '(1)) ; ; (out) (999)
(replace-dmv-map 1 999 '()) ; ; (out) ()
