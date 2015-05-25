scripting
scriptMove: anInteger for: id on: script
	| elementsToMove |
	elementsToMove := visibleElements - 1.
	anInteger = 1
		ifTrue: [ 
			offset = 1
				ifTrue: [ ^ self ].
			offset := offset - elementsToMove ]
		ifFalse: [ 
			offset + elementsToMove abs > items size
				ifTrue: [ ^ self ].
			offset := offset + elementsToMove ].
	script scriptaculous effect
		id: id;
		duration: 0.2;
		x: 0;
		y: self elementHeight * elementsToMove * anInteger;
		move