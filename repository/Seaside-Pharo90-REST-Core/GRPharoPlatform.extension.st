Extension { #name : 'GRPharoPlatform' }

{ #category : '*Seaside-Pharo90-REST-Core' }
GRPharoPlatform >> argumentNamesOf: aCompiledMethod [
	^ aCompiledMethod argumentNames
]

{ #category : '*Seaside-Pharo90-REST-Core' }
GRPharoPlatform >> selectorOfPragma: aPragma [
	^ aPragma selector
]
