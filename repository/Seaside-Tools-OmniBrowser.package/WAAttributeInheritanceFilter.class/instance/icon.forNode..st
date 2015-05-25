filtering
icon: aSymbol forNode: aNode
	aNode isAttribute
		ifFalse: [ ^ #blank ].
	^ aNode isOverride
		ifTrue: [ 
			aNode isOverridden 
				ifTrue: [ #arrowUpAndDown ] 
				ifFalse: [ #arrowUp ] ]
		ifFalse: [ 
			aNode isOverridden 
				ifTrue: [ #arrowDown ] 
				ifFalse: [ #blank ] ]