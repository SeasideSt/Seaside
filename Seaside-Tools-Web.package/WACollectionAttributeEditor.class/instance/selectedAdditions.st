accessing
selectedAdditions
	^ (selectionsCurrent select: [ :each | each key = #add ]) collect: [ :assoc | assoc value ]