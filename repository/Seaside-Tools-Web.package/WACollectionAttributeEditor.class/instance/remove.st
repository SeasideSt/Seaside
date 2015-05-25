actions
remove
	self isOverride
		ifTrue: [
			self expression value isEmpty
				ifTrue: [ self expression value: self selectionsCurrent ]
				ifFalse: [ self expression value: (self removeAll: self selectionsCurrent from: self expression value) ] ]
		ifFalse: [
			self isModify
				ifTrue: [ self expression additions: (self removeAll: self selectedAdditions from: self expression additions) ] ]