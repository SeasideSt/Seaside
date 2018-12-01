Extension { #name : #WADispatcher }

{ #category : #'*seaside-tools-web' }
WADispatcher >> configurationComponent [
	^ WADispatcherEditor on: self
]
