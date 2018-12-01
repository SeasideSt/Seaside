Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-welcome' }
GRGemStonePlatform >> seasideIsAuthorNameSet [

	^GsPackagePolicy current authorInitials ~~ nil
]

{ #category : #'*seaside-gemstone-welcome' }
GRGemStonePlatform >> seasideSetAuthorName: anAuthorName [

	GsPackagePolicy current authorInitials: anAuthorName
]
