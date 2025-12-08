Extension { #name : 'GRPharoPlatform' }

{ #category : '*Seaside-Pharo20-REST-Core' }
GRPharoPlatform >> argumentNamesOf: aCompiledMethod [
	^ aCompiledMethod argumentNames
]

{ #category : '*Seaside-Pharo20-REST-Core' }
GRPharoPlatform >> selectorOfPragma: aPragma [
	^ aPragma keyword
]
