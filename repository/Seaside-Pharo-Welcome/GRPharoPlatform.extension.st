Extension { #name : 'GRPharoPlatform' }

{ #category : '*seaside-pharo-welcome' }
GRPharoPlatform >> seasideIsAuthorNameSet [

	SystemVersion current major >= 13 ifTrue:[ ^ true. "Author does not exist anymore" ].
	^ (Smalltalk at: #Author) fullNamePerSe isEmptyOrNil not
]

{ #category : '*seaside-pharo-welcome' }
GRPharoPlatform >> seasideSetAuthorName: anAuthorName [

	SystemVersion current major >= 13 ifTrue:[ ^ self error: 'Author does not exist anymore.' ].
	(Smalltalk at: #Author) fullName: anAuthorName
]

{ #category : '*Seaside-Pharo-Welcome' }
GRPharoPlatform >> subclassOf: aSuperClass named: aNameSymbol categorized: aCategoryString [
	^ (aSuperClass respondsTo: #<<)
		ifTrue: [
			aSuperClass << aNameSymbol
				package: aCategoryString;
				install ]
		ifFalse: [
			super
				subclassOf: aSuperClass 
				named: aNameSymbol
				categorized: aCategoryString ]
]
