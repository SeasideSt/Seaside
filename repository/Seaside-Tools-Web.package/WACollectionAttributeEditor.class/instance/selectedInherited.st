accessing
selectedInherited
	^ (selectionsCurrent select: [ :each | each key = #inherited ]) collect: [ :assoc | assoc value ]