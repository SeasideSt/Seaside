Extension { #name : #WAComponent }

{ #category : #'*seaside-examples-misc' }
WAComponent classSide >> headerForExampleBrowser [
	^ self name = self description
		ifTrue: [ self name ]
		ifFalse: [ self description , ' (' , self name , ')' ]
]
