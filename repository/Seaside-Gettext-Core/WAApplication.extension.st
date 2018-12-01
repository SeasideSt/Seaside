Extension { #name : #WAApplication }

{ #category : #'*seaside-gettext-core' }
WAApplication >> gettextDomain [
	^ self preferenceAt: #gettextDomain
]
