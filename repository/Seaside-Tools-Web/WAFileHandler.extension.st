Extension { #name : #WAFileHandler }

{ #category : #'*seaside-tools-web' }
WAFileHandler >> configurationComponent [
	^ WAFileHandlerEditor on: self
]
