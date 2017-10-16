(define (sum L s)
	(cond
		((null? (cdr L)) 
			(+ (car L) s))
		(else
			(sum (cdr L) (+ s (car L)))
		)
	)

)
