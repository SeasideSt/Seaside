accessing
seasidePossibleCauses
	^ #(
		'you included self in the return value of #children'
		'You''re probably missing a return (^) somewhere.'
	)