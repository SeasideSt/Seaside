actions
moveDown
	self isModify
		ifTrue: [ self expression additions: (self moveDown: self selectedAdditions using: self expression additions) ]
		ifFalse: [ 
			self isOverride
				ifTrue: [ self expression value: (self moveDown: self selectionsCurrent using: self expression value) ] ]