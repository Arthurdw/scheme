; TODO: fix this
(define (symbol<? s1 s2)
  (string<? (symbol->string s1) (symbol->string s2)))
 
(define (element=? el1 el2)
  (equal? el1 el2))

; (define (merge! lst1 lst2)
;   (let merger!
;     ((res1 lst1)
;      (res2 lst2)
;      (curr (cons 'headed lst1)))
;     (if (null? res1)
;       (begin
;         (set-cdr! curr res2)
;         lst1)
;       (let* ((curr1 (car res1))
;             (curr2 (car res2))
;             (key1 (car curr1))
;             (key2 (car curr2)))
;         (cond ((element=? key1 key2)
;                 (begin
;                   (set-cdr! curr curr1)
;                   (merger! (cdr res1) (cdr res2) (cdr curr))))
;               ((symbol<? key1 key2)
;                 (begin
;                   (set-cdr! curr curr1)
;                   (merger! (cdr res1) res2 (cdr curr))))
;               (else 
;                 (begin
;                   (set-cdr! curr curr2)
;                   (merger! res1 (cdr res2) (cdr curr)))))))))



(define (merge! lst1 lst2)
  (define (do-merge! end)
    'ok)

  (define (merger! end)
    (if (null? end)
      lst1
      (do-merge! end)))
  (merger! lst1)

(define best1 '((ann (meiboomstraat 12 1820 Eppegem))
                (bert (populierendreef 7 1050 Brussel))
                (kurt (Mechelsesteenweg 50 1800 Vilvoorde))))
 
(define best2 '((bert (populierendreef 7 1050 Brussel))
                (jan (eikestraat 1 9000 Gent))
                (sofie (boerendreef 5  2800 Mechelen))))

(merge! best1 best2)
best1
; ((ann (meiboomstraat 12 1820 Eppegem))
;  (bert (populierendreef 7 1050 Brussel))
;  (jan (eikestraat 1 9000 Gent))
;  (kurt (Mechelsesteenweg 50 1800 Vilvoorde))
;  (sofie (boerendreef 5 2800 Mechelen)))
