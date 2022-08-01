; Ryan Porter
; Based off Part2a, only major change is on line 7
#lang scheme
(define (replace-atom atom1 atom2 lst)
    (cond ((empty? lst) '()) ; if empty return empty list
        ((pair? (car lst)) (cons (replace-atom atom1 atom2 (car lst)) (replace-atom atom1 atom2 (cdr lst)))); check if its a nested list and recurse into it if so
        ((equal? atom1 (car lst)) (cons atom2 (replace-atom atom1 atom2 (cdr lst)))) ; if atom1 and first list item are equal, replace atom1 with atom2 and recurse rest of list
        (else (cons (car lst) (replace-atom atom1 atom2 (cdr lst)))))); else, add first list item and recurse

; Test Cases:
; (replace-atom 'a 'b '(a b c d a c a a))                -> (b b c d b c b b)
; (replace-atom 'a 'b '((a b) c () d a c a a))           -> ((b b) c () d b c b b)
; (replace-atom 'a 'b '((((a (a)) b) c () d a c a a)))   -> ((((b (b)) b) c () d b c b b))
; (replace-atom 'a 'b '(a b c d a c (a ((a)))a a))       -> (b b c d b c (b ((b))) b b)
; (replace-atom 'a 'c '(a b c d a c a a))                -> (c b c d c c c c)
; (replace-atom 'a 'c '((a b) c () d a c a a))           -> ((c b) c () d c c c c)
; (replace-atom 'a 'c '((((a (a)) b) c () d a c a a)))   -> ((((c (c)) b) c () d c c c c))
; (replace-atom 'a 'c '(a b c d a c (a ((a)))a a))       -> (c b c d c c (c ((c))) c c)
; (replace-atom 'a 'x '(a b c d a c a a))                -> (x b c d x c x x)
; (replace-atom 'a 'x '((a b) c () d a c a a))           -> ((x b) c () d x c x x)