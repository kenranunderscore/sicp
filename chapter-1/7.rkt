; The original implementation of ~sqrt-iter~, in probably badly translated
; English.

(define (sqrt-iter estimate x)
  (if (good-enough? estimate x)
      estimate
      (sqrt-iter (improve estimate x)
                 x)))

(define (improve estimate x)
  (average estimate
           (/ x
              estimate)))

(define (average x y)
  (/ (+ x y)
     2))

(define (square x)
  (* x x))

(define (good-enough? estimate x)
  (< (abs (- (square estimate) x))
     0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.000008)
; => 0.031, which is way too big.
; Here, the threshold of 0.001 is too big as well, so the algorithm terminates
; too early.

(sqrt 0.04)
; 0.201, quite okay

(sqrt 1000000000000000000000.0)
; This does not terminate on my machine because it keeps trying to call
; ~improve~ without ever actually improving the value. We don't have the
; precision to really check for the condition.

; Now we try to find a better solution:

(define (good-enough-2? estimate x)
  (= (improve estimate x)
     estimate))

(define (sqrt-iter-2 estimate x)
  (if (good-enough-2? estimate x)
      estimate
      (sqrt-iter-2 (improve estimate x)
                   x)))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x))

(sqrt-2 0.000008)
; ~ 0.00283, pretty good

(sqrt-2 1000000000000000000000.0)
; works as well now
