Extension { #name : 'WAApplication' }

{ #category : '*seaside-gettext-core' }
WAApplication >> gettextApplicationName [
	^ self preferenceAt: #gettextApplicationName
]
