; Ryan Porter
#lang scheme

(define (sort lst)
  (bubble-sort (length lst) lst)) ; Program starts here and then calls the bubble sort function with the list and its length

(define (bubble-sort len lst)
  (cond ((= len 1) (bubble-up lst)) ; Run bubble-up function for each number in list
        (else (bubble-sort (- len 1) (bubble-up lst)))))

(define (bubble-up lst)
    (if (null? (cdr lst)) lst  ; if there is only one number in list, return it  
        (if (< (car lst) (cadr lst)) ; If the first number is less than the 2nd
            (cons (car lst) (bubble-up (cdr lst))) ; Move to next in list without changing order
            (cons (cadr lst) (bubble-up (cons (car lst) (cddr lst))))))) ; Swap numbers and move to next in list

; Test cases:
; (sort '(65 13 59 81 31))                  -> (13 31 59 65 81)
; (sort '(28 45 97 76 55))                  -> (28 45 55 76 97)
; (sort '(58 32 85 14 18))                  -> (14 18 32 58 85)
; (sort '(46 79 57 29 38))                  -> (29 38 46 57 79)
; (sort '(53 88 38 14 54))                  -> (14 38 53 54 88)
; (sort '(396 402 13 314 577 1000 866 44))  -> (13 44 314 396 402 577 866 1000)
; (sort '(225 988 884 935 448 136 620 468)) -> (136 225 448 468 620 884 935 988)
; (sort '(870 583 970 722 456 884 719 445)) -> (445 456 583 719 722 870 884 970)
; (sort '(385 415 246 408 859 379 336 586)) -> (246 336 379 385 408 415 586 859)
; (sort '(425 544 11 496 578 892 520 861))  -> (11 425 496 520 544 578 861 892)
