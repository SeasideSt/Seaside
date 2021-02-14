Extension { #name : #WAComponent }

{ #category : #'*Seaside-Examples-misc' }
WAComponent class >> headerForExampleBrowser [
	^ self name = self description
		ifTrue: [ self name ]
		ifFalse: [ self description , ' (' , self name , ')' ]
]
