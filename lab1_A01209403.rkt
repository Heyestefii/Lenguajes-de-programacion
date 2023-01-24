;; ITESM QRO
;; Diana Estefanía Ortiz Ledesma
;; A01209403
;; Lab 1

#lang racket

;; triangle-area: number number -> number
;; triangle-area receives the base and the height and returns the area of a triangle.
(define (triangle-area base height)
  (/ (* base height) 2))

;; Example
;; (triangle-area 3 6) = 9

;; a: number -> number
;; a raise n to the power of 2 and add 10
(define (a n)
  (+ (* n n) 10))

;; Example
;; (a 6) = 46

;; b: number -> number
;; b raise n to the power of 2, multiply it by 1/2 and add 20
(define (b n)
  (+ (* (* n n) 1/2) 20))

;; Example
;; (b 8) = 52

;; c: number -> number
;; c divide 1 by n and substract it from 2
(define (c n)
  (- 2 (/ 1 n)))

;; Example
;; (c 5) = 9/5 

;; solutions: number number number -> boolean
;; solutions receives a, b, and c and returns the number of possible solutions for a quadratic equation
(define (solutions a b c)
  (cond
    [(> (* b b) (* 4 a c)) 2]
    [(= (* b b) (* 4 a c)) 1]
    [(< (* b b) (* 4 a c)) 0]))

;; Example
;; (solutions 1 0 -1) = 2
;; (solutions 2 4 2) = 1
