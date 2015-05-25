accessing
selectedRemovals
	^ (selectionsCurrent select: [ :each | each key = #remove ]) collect: [ :assoc | assoc value ]