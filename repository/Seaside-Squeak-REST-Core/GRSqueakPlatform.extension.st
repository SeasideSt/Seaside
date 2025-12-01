Extension { #name : 'GRSqueakPlatform' }

{ #category : '*seaside-squeak-rest-core' }
GRSqueakPlatform >> argumentNamesOf: aCompiledMethod [
	^ aCompiledMethod methodNode arguments collect: [ :each | each key ]
]

{ #category : '*seaside-squeak-rest-core' }
GRSqueakPlatform >> selectorOfPragma: aPragma [

	^aPragma keyword
]
