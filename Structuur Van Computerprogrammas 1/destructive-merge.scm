(define (symbol<? s1 s2)
  (string<? (symbol->string s1) (symbol->string s2)))
 
(define (element=? el1 el2)
  (equal? el1 el2))

(define (merge! b1 b2)
  (define (key=? l1 l2)
    (element=? (car l1) (car l2)))

  (define (key<? l1 l2)
    (symbol<? (car l1) (car l2)))

  (define (hulp prev l1 l2)
    (cond ((null? l1) (set-cdr! prev l2))
          ((null? l2) (set-cdr! prev l1))
          ((key=? (car l1) (car l2))
           (set-cdr! prev l1)
           (hulp l1 (cdr l1) (cdr l2)))
          ((key<? (car l1) (car l2))
           (set-cdr! prev l1)
           (hulp l1 (cdr l1) l2))
          (else 
            (set-cdr! prev l2)
            (hulp l2 l1 (cdr l2)))))

  (let ((dummy (cons 'dummy '())))
    (hulp dummy b1 b2)
    (cdr dummy)))

(define best1 '((ann (meiboomstraat 12 1820 Eppegem))
                (bert (populierendreef 7 1050 Brussel))
                (kurt (Mechelsesteenweg 50 1800 Vilvoorde))))
 
(define best2 '((bert (populierendreef 7 1050 Brussel))
                (jan (eikestraat 1 9000 Gent))
                (sofie (boerendreef 5  2800 Mechelen))))

(merge! best1 best2) ; ; (out) ((ann (meiboomstraat 12 1820 Eppegem)) (bert (populierendreef 7 1050 Brussel)) (jan (eikestraat 1 9000 Gent)) (kurt (Mechelsesteenweg 50 1800 Vilvoorde)) (sofie (boerendreef 5 2800 Mechelen)))
