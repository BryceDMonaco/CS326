;Bryce Monaco
;CS 326
;HW2

;Note: member? is not a hw function but I was getting errors when I didn't manually define it
(define (member? x L)
	(cond 
		((null? L)
			#f)
		((equal? x (car L))
			#t)
		(else
			(member? x (cdr L))
		)
	)
)

;=======================================================================================
;Question 1 Functions:
(define (is-set? M)
	(cond 
		((null? M)
			#t)
		((member? (car M) (cdr M)) 
			#f)
		(else 
			(is-set? (cdr M))
		)
	)
)

(define (make-set L)
	(cond
		((null? L)
			'())
		((not (member? (car L) (cdr L)))
			(cons (car L) (make-set (cdr L))))
		(else
			(make-set (cdr L))
		)
	)
)

(define (subset? A S)
	(cond
		((null? A)
			#t)
		((null? S)
			#f)
		((member? (car A) S)
			(subset? (cdr A) S))
		(else
			#f
		)
	)
)

(define (union A B)
	(cond 
		((null? A)
			B)
		(else
			(make-set (cons (car A) (union (cdr A) B)))
		)
	)
)

(define (intersection A B)
	(cond
		((null? A)
			'())
		((member? (car A) B)
			(cons (car A) (intersection (cdr A) B)))
		(else
			(intersection (cdr A) B)
		)
	)
)

;=======================================================================================
;Question 2 Functions:
(define T
	'(13
		(5
 			(1 () ())
 			(8 ()
 				(9 () ())))
		(22
			(17 () ())
			(25 () ())
		)
	)
)

(define (val T)
	(car T)
) 

(define (left T)
	(car (cdr T))
)

(define (right T)
	(car (cdr (cdr T)))
)

(define (tree-member? v T)
	(cond 
		((null? T)
			#f)
		((equal? v (val T))
			#t)
		(else 
			(or (tree-member? v (left T)) (tree-member? v (right T)))
		)
	)
)

(define (preorder T) ;Expected Test Output: (13 5 1 8 9 22 17 25)
	(cond 
		((null? T)
			'())
		((and (null? (left T)) (null? (right T))) ;left is null, right is too
			(list (val T)))
		((and (null? (left T))  (not (null? (right T)))) ;left is null, right is not
			(append (list (val T)) (preorder (right T))))
		((and (null? (right T))  (not (null? (left T)))) ;right is null, left is not
			(append (list (val T)) (preorder (left T))))
		(else
			(append (list (val T)) (append (preorder (left T)) (preorder (right T))))
		)
	)
)

(define (inorder T) ;Expected Test Output: (1 5 8 9 13 17 22 25) 
	(cond 
		((null? T)
			'())
		((and (null? (left T)) (null? (right T))) ;left is null, right is too
			(list (val T)))
		((and (null? (left T))  (not (null? (right T)))) ;left is null, right is not
			(append (list (val T)) (inorder (right T))))
		((and (null? (right T))  (not (null? (left T)))) ;right is null, left is not
			(append (inorder (left T)) (list (val T))))
		(else
			(append (inorder (left T)) (append (list (val T)) (inorder (right T))))
		)
	)
)

;=======================================================================================
;Question 3 Functions:
(define n  '(1 2 3 (4 3) 5 (6 (3 7)) 8) )

(define (deep-delete v L) ;Expected Test Output: (1 2 (4) 5 (6 (7)) 8) 
	(cond
		((null? L)
			'())
		((not (list? L))
			L)
		((equal? v (car L))
			(deep-delete v (cdr L)))
		((list? L)
			(cons (deep-delete v (car L)) (deep-delete v (cdr L))))
		(else
			(cons (car L) (deep-delete v (cdr)))
		)
	)
)

;=======================================================================================
;Extra Credit Function:
(define T
	'(13
		(5
 			(1 () ())
 			(8 ()
 				(9 () ())))
		(22
			(17 () ())
			(25 () ())
		)
	)
)

(define (insert-bst v T)
	(cond
		((equal? v (val T))
			)
		((< v (val T))
			)
		((> v (val T))
			)
	)

)