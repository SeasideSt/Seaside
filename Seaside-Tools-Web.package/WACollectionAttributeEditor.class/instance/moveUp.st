actions
moveUp
	self isModify
		ifTrue: [ self expression additions: (self moveUp: self selectedAdditions using: self expression additions) ]
		ifFalse: [ 
			self isOverride
				ifTrue: [ self expression value: (self moveUp: self selectionsCurrent using: self expression value) ] ]