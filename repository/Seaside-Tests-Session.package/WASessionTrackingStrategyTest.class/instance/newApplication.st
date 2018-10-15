private
newApplication
	^ WARedirectingApplication new
		cache: WAUnidirectionalCache new;
		yourself