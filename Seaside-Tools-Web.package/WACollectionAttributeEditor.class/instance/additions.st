accessing
additions
	^ (self currentList select: [ :each | each key = #add ]) collect: [ :assoc | assoc value ]