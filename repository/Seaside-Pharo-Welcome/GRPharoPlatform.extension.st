Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-welcome' }
GRPharoPlatform >> seasideIsAuthorNameSet [
	^ Author fullNamePerSe isEmptyOrNil not
]

{ #category : #'*seaside-pharo-welcome' }
GRPharoPlatform >> seasideSetAuthorName: anAuthorName [
	Author fullName: anAuthorName
]
