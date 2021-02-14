Extension { #name : #WAImageButtonTag }

{ #category : #'*seaside-pharo-canvas' }
WAImageButtonTag >> form: aForm [
	self extent: aForm extent.
	self document: aForm
]
