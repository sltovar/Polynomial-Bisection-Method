#lang racket
;-------------------------------------
; Bisection Method
;-------------------------------------

; Polynomial definition
(define (myPolynomial x)
  (- (- (* 5(* x x)) x) 8))        

; Biesction equation
(define (bisection x xlow xhigh)
; The calculated x low and high values are set to named parameters
; Midpoint is being called inline, with no variable. Each instance of
  ; midpoint is called as a function.
  
  ; Accuracy check 'if statement'
  (if (<= (abs (x (midpoint xlow xhigh))) 0.001)
      ; End recursion if midpoint value is zero, or 0.001 away.
      (printf "The zero is at x = ~a \n" (midpoint xlow xhigh)) 
      ; Bisection portion with recursive calls
      ; The x value in this case is the myPolynomial function
      ; If the value of xlow, ran through x, multiplied by the
      ; midpoint (also through x) is greater than zero--
      (if (> (* (x xlow) (x (midpoint xlow xhigh))) 0) 
          (bisection x (midpoint xlow xhigh) xhigh)
          (bisection x xlow (midpoint xlow xhigh)))))

; Midpoint function definition
; Midpoint is defined outside
(define (midpoint xlow xhigh)
  ; The midpoint is calculated with given x values
  (/(+ xlow xhigh) 2))

; Function call, setting myPolynomial1's values to 1 and 2
(bisection myPolynomial 1.0 2.0)

;-----------------------------------
; SECOND POLYNOMIAL FUNCTION
;-----------------------------------

; Polynomial definition
(define (myPolynomial2 x)
  (- (- (* 4(* x x)) x) 2))        

; Function call, setting myPolynomial1's values to -3 and 0
(bisection myPolynomial2 -3.0 0.0)
