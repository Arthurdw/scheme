(define (schrap-3 lst)
  (define (schrapper idx overig)
    (cond ((null? overig) '())
          ((= idx 3) (schrapper 1 (cdr overig)))
          (else (cons (car overig) (schrapper (+ 1 idx) (cdr overig))))))
  (schrapper 1 lst))

(define (schrap-n n lst)
  (define (schrapper idx overig)
    (cond ((null? overig) '())
          ((= idx n) (schrapper 1 (cdr overig)))
          (else (cons (car overig) (schrapper (+ idx 1) (cdr overig))))))
  (schrapper 1 lst))

;(schrap-3 '(1 2 3 4 5 6 7 8))
;(schrap-3 '(a b c d e f g h j k l m n o p))
;
;(schrap-n 4 '(1 2 3 4 5 6 7 8))
;(schrap-n 4 '(a b c d e f g h j k l m n o p))

(define (fib-3 n)
  (cond ((< n 2) 0)
        ((= n 2) 1)
        (else (+ (fib-3 (- n 1))
                 (fib-3 (- n 2))
                 (fib-3 (- n 3))))))

; (fib-3 5)
(define (fib-sum ctr n p)
  (if (> ctr p)
      0
      (+ (fib-sum (+ ctr 1) n p) (fib-p (- n ctr) p))))

(define (fib-p n p)
  (cond ((< n (- p 1)) 0)
        ((= n (- p 1)) 1)
        (else (fib-sum 1 n p))))

;(fib-p 5 3)
;(fib-p 10 5)

(define (add-to-end item lst)
  (if (null? lst)
      (list item)
      (cons (car lst) (add-to-end item (cdr lst)))))

;(add-to-end 999 '(1 2 3 4 5))
;(add-to-end 999 '())
;(add-to-end 999 '(1))

(define (my-append l1 l2)
  (define (iter acc remainder)
    (if (null? remainder)
        (reverse acc)
        (iter (cons (car remainder) acc) (cdr remainder))))
  (iter (reverse l1) l2))

;(my-append '(1 2 3) '(4 5))
;(my-append '(1 2 3) '())
;(my-append '() '(1 2 3))
;(my-append '() '())

(define (rec-reverse lst)
  (if (null? lst)
      lst
      (append (rec-reverse (cdr lst)) (list (car lst)))))
      

(define (iter-reverse collection)
  (define (iter acc lst)
    (if (null? lst)
        acc
        (iter (cons (car lst) acc) (cdr lst))))
  (iter '() collection))
    

;(rec-reverse '(1 2 3))
;(rec-reverse '(1))
;(rec-reverse '())
;(iter-reverse '(1 2 3))
;(iter-reverse '(1))
;(iter-reverse '())

(define (last lst)
  (cond
    ((null? lst) #f)
    ((null? (cdr lst)) (car lst))
    (else (last (cdr lst)))))

;(last '(1 2 3))
;(last '(1))
;(last '())

(define (replace search value target)
  (define (replacer target)
    (cond ((null? target) '())
          ((= search (car target)) (cons value (replacer (cdr target))))
          (else (cons (car target) (replacer (cdr target))))))
  (replacer target))

;(replace 1 999 '(1 2 1 3 1 4 1 5 1))
;(replace 1 999 '(2 3 4 5 6 7))
;(replace 1 999 '(1))
;(replace 1 999 '())


(define (my-equal? left right)
  (if (and (pair? left) (pair? right))
      (and (eq? (car left) (car right)) (my-equal? (cdr left) (cdr right)))
      (eq? left right)))

;(my-equal? '(1 2 3) '(1 2 3))
;(my-equal? '(1 2 3) '(4 5 6))
;(my-equal? '(1 2 3) '(1 2))
;(my-equal? '(1 2 3) '())
;(my-equal? '() '(1 2 3))


(define (intersperse e l)
  (define (helper first e l)
    (if (null? l)
        '()
        (append
         (if first
             (list (car l))
             (list e (car l)))
         (helper #f e (cdr l)))))
  (helper #t e l))

;(intersperse 1 '(3 4 5))
;(intersperse 1 '(9))
;(intersperse 1 '())

(define (my-cons left right)
  (lambda (operation) (operation left right)))

(define (my-car target)
  (target (lambda (left _) left)))

(define (my-cdr target)
  (target (lambda (_ right) right)))

(define (my-cadr target)
  (my-car (my-cdr target)))

(define (my-caddr target)
  (my-car (my-cdr (my-cdr target))))

;(define my-pair (my-cons 1 (my-cons 2 (my-cons 3 '()))))
;(my-car my-pair)
;(my-cadr my-pair)
;(my-caddr my-pair)

(define (replace-dmv-map search value target)
  (map (lambda (item)
         (if (= item search)
             value
             item))
       target))

;(replace-dmv-map 1 999 '(1 2 1 3 1 4 1 5 1))
;(replace-dmv-map 1 999 '(2 3 4 5 6 7))
;(replace-dmv-map 1 999 '(1))
;(replace-dmv-map 1 999 '())

(define (sum lst)
  (if (null? lst)
      0
      (+ (car lst) (sum (cdr lst)))))

(define (avg lst)
  (/ (sum lst) (length lst)))

(define (select-from lst predicate)
  (define (iter acc remainder)
    (cond ((null? remainder) acc)
          ((predicate (car remainder)) (iter (cons (car remainder) acc) (cdr remainder)))
          (else (iter acc (cdr remainder)))))
  (reverse (iter '() lst)))

(define (rec-splits data)
  (let* ((actual (cdr data))
         (average (avg actual)))
    (define less (select-from actual (lambda (item) (< item average))))
    (define more (select-from actual (lambda (item) (> item average))))
    (list (car data) less more)))
  
;(rec-splits '("algoritmen en datastructuren" 12 8 17 15 6 15))

(define (splits-alle data)
  (list (car data)
        (map rec-splits (cdr data))))


(define kvp '(("hi" 1) ("bye" 2) (("bye" sir) 3)))
(assq "hi" kvp)
(assq "bye" kvp)
(assq '("bye" sir) kvp)
(assoc '("bye" sir) kvp)

(define (dict) (list))

(define (get ident dict)
  (define fetched (assoc ident dict))
  (if (not (boolean? fetched))
      (cadr fetched)
      fetched))

(define (has ident dict)
  (define fetched (assoc ident dict))
  (boolean? fetched))

(define (filter lst predicate)
  (define (iter acc remainder)
    (cond ((null? remainder) acc)
          ((predicate (car remainder)) (iter (cons (car remainder) acc) (cdr remainder)))
          (else (iter acc (cdr remainder)))))
  (reverse (iter '() lst)))
        
(define (remove ident dict)
  (filter
   dict
   (lambda (item) (not (equal? (car item) ident)))))

(define (set ident value dict)
  (append
   (remove ident dict)
   (list (list ident value))))

kvp
(get "hi" kvp)
(remove "bye" kvp)
(set "bye" 2 kvp)
(set "bye" 3 kvp)
