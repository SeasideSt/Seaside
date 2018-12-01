Extension { #name : #Duration }

{ #category : #'*javascript-core' }
Duration >> javascriptOn: aStream [
	aStream javascript: self asMilliseconds
]
