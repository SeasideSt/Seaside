Extension { #name : #DateAndTime }

{ #category : #'*seaside-json-core' }
DateAndTime >> jsonOn: aRenderer [
	aRenderer dateAndTime: self
]
