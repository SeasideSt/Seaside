Extension { #name : #Collection }

{ #category : #'*Seaside-Core' }
Collection >> renderOn: html [
	self do: [ :each | html render: each ]
]
