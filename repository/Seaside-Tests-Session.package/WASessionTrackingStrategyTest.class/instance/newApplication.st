private
newApplication
	^ WAApplication new
		cache: WAUnidirectionalCache new;
		yourself