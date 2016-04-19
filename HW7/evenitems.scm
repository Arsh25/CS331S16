#lang scheme 

;evenitems: 
;Pre: None
;Post: Returns a list of all items in given list with even index 
(define (evenitems list)
  (if (null? list) '()
       (if (not(null? (cdr list)))
                (cons (car list) (evenitems (cddr list))) 
         list)
       
   )
 )



