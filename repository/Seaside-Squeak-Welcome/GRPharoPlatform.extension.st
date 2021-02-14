Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-squeak-welcome' }
GRPharoPlatform >> seasideIsAuthorNameSet [
	^ Utilities authorInitialsPerSe isEmptyOrNil not
]

{ #category : #'*seaside-squeak-welcome' }
GRPharoPlatform >> seasideSetAuthorName: anAuthorName [
	Utilities setAuthorInitials: anAuthorName
]
