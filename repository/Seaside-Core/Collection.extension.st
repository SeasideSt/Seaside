Extension { #name : #Collection }

{ #category : #'*seaside-core' }
Collection >> renderOn: html [
	self do: [ :each | html render: each ]
]
