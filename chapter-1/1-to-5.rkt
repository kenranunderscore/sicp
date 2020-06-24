#lang sicp

;; Exercise 1.1

10
; => 10

(+ 5 3 4)
; => 12

(- 9 1)
; => 8

(/ 6 2)
; => 3

(+ (* 2 4) (- 4 6))
; => 6

(define a 3)
; => #<void>

(define b (+ a 1))
; => #<void>

(+ a b (* a b))
; => 19

(= a b)
; => #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; => 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; => 16

(+ 2 (if (> b a) b a))
; 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; => 16

;; Exercise 1.2


(/ (+ 5 4 (- 2
             (- 3
                (+ 6 (/ 4
                        5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;; Exercise 1.3

; Square a number.
(define (square x)
  (* x x))

; Get the second-greatest of three numbers.
(define (second-greatest a b c)
  (max (min a b)
       (min a c)
       (min b c)))

; Add the squares of the two greatest of its arguments.
(define (square-two-greatest-arguments a b c)
  (+ (square (second-greatest a b c))
     (square (max a b c))))

;; Exercise 1.4

; This function - as defined in the book - chooses the operator
; based on whether b is positive or not.
; Thus, we get (+ a b) in case b is positive, (- a b) otherwise,
; resulting in (+ a (abs b)).
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
