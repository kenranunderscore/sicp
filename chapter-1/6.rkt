(define (new-if predicate? then-clause else-clause)
  (cond (predicate? then-clause)
        (else else-clause)))

; Now use ~new-if~ to rewrite ~sqrt-iter~

(define (sqrt-iter estimate x)
  (new-if (good-enough? estimate x)
          estimate
          (sqrt-iter (improve estimate x)
                     x)))

; ~cond~ is not a special form like ~if~, so no short-circuiting takes place. In
; other words (IIUC) applicative-order evaluation is used, which means that
; ~sqrt-iter~ endlessly calls itself.
