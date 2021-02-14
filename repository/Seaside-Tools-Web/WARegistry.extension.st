Extension { #name : #WARegistry }

{ #category : #'*seaside-tools-web' }
WARegistry >> configurationComponent [
	^ WARegistryEditor on: self
]
