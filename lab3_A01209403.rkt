#lang racket

;; ITESM QRO
;; Diana Estefanía Ortiz Ledesma
;; A01209403
;; Lab 3

;; deep-all-x? : list x -> boolean
;; deep-all-x? receives a list containing other lists (deep list) and a element x.
;; The function returns true if every single element in the list of lists is x. Otherwise it returns false.

(define (deep-all-x?-1 list x acum)
  (cond
    [(empty? list) acum]
    [(list? (first list))
     (and (deep-all-x? (first list) x)(deep-all-x?-1 (rest list) x acum))]
    [else
     (deep-all-x?-1 (rest list) x (and (eq? (first list) x) acum))]))

(define (deep-all-x? list x)
  (deep-all-x?-1 list x true))

;; Example
;; (deep-all-x? '(a (b (c d)) e (f g)) 'a)
;; (deep-all-x? '(a (a (a a)) a (a a)) 'a)
;; (deep-all-x? '(2 (2 (2 2)) 2 (2 2)) '2)

;; deep-reverse : list -> list
;; deep-reverse receives a deep list and the functions returns a list of lists with its
;; elements in reverse order.

(define (deep-reverse-1 list acum)
  (cond
    [(empty? list) acum]
    [(list? (first list))
     (deep-reverse-1 (rest list)(cons(deep-reverse(first list))acum))]
    [else
     (deep-reverse-1 (rest list)(cons(first list)acum))]))

(define (deep-reverse list)
  (deep-reverse-1 list empty))

;; Example
;; (deep-reverse '(a (b (c d))e(f g)))

;; flatten : list -> list
;; flatten receives a deep list and return a list containing all the elements in a single
;; one level list.

(define (append a b)
  (cond
    [(empty? a) b] 
    [else (cons(first a)(append(rest a) b))]))

(define (flatten list)
  (cond
    [(empty? list) empty]
    [(list? (first list))
     (append (flatten (first list)) (flatten (rest list)))]
    [else
     (cons (first list) (flatten (rest list)))]))

;; Example
;; (flatten '(a (b (c d))e(f g)))

;; count-levels : list -> number
;; count levels counts the max depth of a tree

(define (longer a b)
  (cond
    [(> a b) a]
    [else b]))
  
(define (count-levels-1 list acum)
  (cond
    [(empty? list) acum]
    [(list? (first list))
     (longer (count-levels-1 (first list) (+ acum 1))(count-levels-1 (rest list) acum))]
    [else (count-levels-1 (rest list) acum)]))

(define (count-levels list)
  (count-levels-1 list 1))

;; Example
;; (count-levels '(a(b(c)(d))(e(f)(g))))

;; count-max-arity : list -> number
;; count-max-arity which counts the max number of children a single node of the tree has.

(define (count-max-arity-1 list acum)
  (cond
    [(empty? list) acum]
    [(list? (first list))
     (longer (count-max-arity (first list))(count-max-arity-1 (rest list)(+ acum 1)))]
    [else (count-max-arity-1 (rest list)(+ acum 0))]))

(define (count-max-arity list)
  (count-max-arity-1 list 0))

;; Example
;; (count-max-arity '(a (b (c)(d))(e (f)(g)(h)(i))))