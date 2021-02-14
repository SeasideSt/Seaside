Extension { #name : #WAApplication }

{ #category : #'*seaside-tools-web' }
WAApplication >> cloneHandler [
	^ super cloneHandler
		clear;
		yourself
]
