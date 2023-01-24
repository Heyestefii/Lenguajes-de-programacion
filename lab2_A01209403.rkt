#lang racket

;; ITESM QRO
;; Estefanía Ortiz
;; A01209403
;; Lab 2

;; power-head: number number -> number
;; power-head calculate the power of the given number
(define (power-head a b)
  (cond
    [(= b 1) a]
    [else (* (power-head a (- b 1)) a)]))

;; Example
;; (power-head 4 3)

;; power-tail: number number number -> number
;; power-tail calculate the power of the given number
(define (power-tail a b c)
  (if (= b 1)
      c
      (let ((d (* c a)))
        (power-tail a (- b 1) d))))
  (define (power-tail-2 a b)
    (power-tail a b a))

;; Example
;; (power-tail-2 4 3)

;; third: list number -> number 
;; third returns the third element of a list
(define (third list)
  (cond
    [(empty? list) empty]
    [else (first(rest(rest list)))]))

;; Example
;; (third (cons 1(cons 2 (cons 8 (cons 4 (cons 5 empty))))))
;; (third '())
;; (third (cons 1(cons 2 (cons 6 empty))))

;; just-two: list number -> boolean
;; just two returns true if a list contains only two elements
(define (just-two l r)
  (cond
     [(and (= r 2) (empty? l)) true]
     [(empty? l) false]
     [else (let ((m (+ r 1)))
	(just-two (rest l) m))])) 
(define (just-two-2 l)
  (just-two l 0))

;; Example
;; (just-two-2 (cons 1 empty)) 
;; (just-two-2 (cons 1 (cons 4 empty))) 

;; how-many-x?: list symbol symbol -> symbol
;; how-many-x? receives a list and return the number of elements that match x
(define (how-many-x? list x)
  (if (empty? list) 0
      (if (= (first list) x)
          (+ 1 (how-many-x? (rest list) x))
          (how-many-x? (rest list) x))))

;; Example
;; (define list (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
;; (how-many-x? list 3)  

;; all-x: list symbol symbol -> symbol
;; all-x returns true if every element of the list is x
(define (all-x l x r) 
  (cond
     [(empty?  l) r]
    [else (all-x (rest l) x (and (eq? (first l) x) r))]))
(define (all-x-2 l x)
  (all-x l x true))

;; Example
;; (all-x-2 (cons 1 (cons 1 (cons 1 (cons 1 (cons 1  empty))))) 1)

;; get: list number number symbol -> symbol
;; get receives a list and a position and returns the value in that position of the list
(define (get list a)
  (cond
    [(null? list) list]
    [(= a 1) (first list)]
    [else (get (rest list) (- a 1))])) 

;; Example
;; (define list (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
;; (get list 2) 
;; (get list 5) 

;; difference: list list -> list
;; difference receives 2 lists A and B and return a new list that contains the elements in A that re not present in B
(define (difference a b)
  (if (empty? a) empty
      (if (empty? b) empty
          (if (= (first a)(first b))
              (difference a (rest b))
              (cons(first a)(difference(rest a) b))))))
;; Example
;; (difference '(12 44 55 77 66 1 2 3 4) '(1 2 3))

;; append: list list -> list
;; append receives 2 lists A and B and return only 1 list with the elements of A followed by the elements of B
(define (append a b)
  (cond
    [(empty? a) b] 
    [else (cons(first a)(append(rest a) b))]))

;; Example
;; (append '(a b c d) '(e f g))
;; (append  '( ) '(a b c))

;; invert : list list -> list
;; invert inverts the order of the elements in a list
(define (invert list r) 
  (cond
    [(empty? list) r]
    [else (invert (rest list)(cons(first list) r))]))
(define (invert-2 list)
  (invert list empty))

;; Example
;; (invert-2 '(a b c d))
;; (invert-2 '())

;; sign: list -> list
;; sign receives a list of numbers and returns a list of 1 or -1 depending on whether each number is greater or lesser than 0
(define (sign list)
  (cond
    [(empty? list) empty]
    [else (cond
            [(>= (first list) 0)
             (cons 1 (sign (rest list)))]
            [else (cons -1(sign(rest list)))])]))
;; Example
;; (sign  '(2 -4 -6))

;; negatives : list -> list
;; negatives receives a list of positive numbers and returns a list with the corresponding negative numbers
(define (negatives list)
  (cond
    [(empty? list) empty]
    [else (cond
            [(>= (first list) 0)
             (cons (* -1 (first list))(negatives(rest list)))]
            [else (cons(first list)(negatives(rest list)))])]))

;; Example
;; (negatives '(2 -4 6))
;; (negatives '())