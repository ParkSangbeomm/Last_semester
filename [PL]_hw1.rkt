#lang plai
(define (dollar->won a) (* 1126 a))
(define (digit_sum a b c) (+ a b c))
(define (inchworm-travel n hours) (* 2.54 n hours))
(define (is-odd? a) (= (modulo a 2) 1))


(is-odd? 3)
(is-odd? 4)
(inchworm-travel 3 18)
(digit_sum 1 2 3)
(dollar->won 5)
