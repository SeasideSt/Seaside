Extension { #name : 'GRPlatform' }

{ #category : '*seaside-welcome' }
GRPlatform >> seasideIsAuthorNameSet [
	self subclassResponsibility
]

{ #category : '*seaside-welcome' }
GRPlatform >> seasideSetAuthorName: anAuthorName [
	self subclassResponsibility
]

{ #category : '*Seaside-Welcome' }
GRPlatform >> subclassOf: aSuperClass named: aNameSymbol categorized: aCategoryString [
	^ aSuperClass
		subclass: aNameSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: aCategoryString
]
