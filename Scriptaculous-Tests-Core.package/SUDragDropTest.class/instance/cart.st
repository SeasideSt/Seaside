accessing
cart
	^ cart ifNil: [ cart := Bag new ]