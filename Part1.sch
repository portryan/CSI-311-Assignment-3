; Ryan Porter
#lang scheme
(define (abs-list lst) ; function abs-list with parameter lst
  (cond ((empty? lst) '()) ; if list is empty, return empty list
    (else (cons (abs (car lst)) (abs-list (cdr lst)))))) ; take absolute value of first in list and construct with rest of list

; Test cases:
; (abs-list '(1 -5 3 -9 -1 0 7))              -> (1 5 3 9 1 0 7)
; (abs-list '())                              -> ()
; (abs-list '(-1 -2 3 -4 -5))                 -> (1 2 3 4 5)
; (abs-list '(-10 9 -8 -7 6 -5 4 -3 2 -1 0))  -> (10 9 8 7 6 5 4 3 2 1 0)
; (abs-list '(-5))                            -> (5)
; (abs-list '(1000 100 10 1))                 -> (1000 100 10 1)
; (abs-list '(-9 -8 -7))                      -> (9 8 7)
; (abs-list '(2 -4 -6 -8))                    -> (2 4 6 8)
; (abs-list '(-1 -3 -5 -7 9))                 -> (1 3 5 7 9)
; (abs-list '(-3 1 4 1 5 -9))                 -> (3 1 4 1 5 9)