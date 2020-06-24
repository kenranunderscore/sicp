; Implement the Newton method for cube roots, that is, we want to calculate a
; number ~y~ for any given number ~x~ such that (* y y y) is equal to x.

(define (cube-root-iter estimate x)
  (if (good-enough? estimate x)
      estimate
      (cube-root-iter (improve estimate x)
                      x)))

; As before: stop once we cannot improve any further.
(define (good-enough? estimate x)
  (= (improve estimate x)
     estimate))

(define (improve estimate x)
  (/ (+ (/ x (* estimate estimate))
        (* 2 estimate))
     3))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 0.000007)
; works

(cube-root 10000000000000000000000)
; works as well as can be expected, given the precision
