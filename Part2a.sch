; Ryan Porter
#lang scheme
(define (delete-atom atom lst) 
  (cond ((empty? lst) '()) ; if empty return empty list
        ((pair? (car lst)) (cons (delete-atom atom (car lst)) (delete-atom atom (cdr lst)))); check if its a nested list and recurse into it if so
        ((equal? atom (car lst)) (delete-atom atom (cdr lst))) ; if atom and first list item are equal, skip list item and recurse rest of list
        (else (cons (car lst) (delete-atom atom (cdr lst)))))); else, add first list item and recurse

; Test Cases:
; (delete-atom 'a '(a b c d a c a a))              -> (b c d c)
; (delete-atom 'a '((a b) c () d a c a a))         -> ((b) c () d c)
; (delete-atom 'a '(((a (a)) b) c () d a c a a))   -> (((()) b) c () d c)
; (delete-atom 'a '(a b c d a c (a ((a)))a a))     -> (b c d c ((())))
; (delete-atom 'c '(a b c d a c a a))              -> (a b d a a a)
; (delete-atom 'c '((a b) c () d a c a a))         -> ((a b) () d a a a)
; (delete-atom 'c '(((a (a)) b) c () d a c a a))   -> (((a (a)) b) () d a a a)
; (delete-atom 'c '(a b c d a c (a ((a)))a a))     -> (a b d a (a ((a))) a a)
; (delete-atom 'b '(a ((b c a) (c b a)) b))        -> (a ((c a) (c a)))
; (delete-atom 'a '())                             -> ()
